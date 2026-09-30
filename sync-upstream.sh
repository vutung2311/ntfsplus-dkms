#!/bin/bash
# SPDX-License-Identifier: GPL-2.0
#
# Regenerate the driver sources from the linux-ntfs submodule:
#
#   1. copy the upstream *.c, *.h and Kconfig into this directory, with
#      lib/ flattened (makepkg cannot take local sources from subdirectories)
#   2. apply patches/*.patch in order; any rejected hunk aborts the sync
#   3. rewrite the upstream file list, pkgver and checksums in PKGBUILD
#   4. build the module in a temporary directory as a compile check
#
# Update the submodule first, for example:
#   git -C linux-ntfs fetch && git -C linux-ntfs checkout origin/ntfs-next
#
# Usage: ./sync-upstream.sh [--no-build] [--accept-makefile] [--allow-downgrade]
#   --no-build         skip the compile check
#   --accept-makefile  upstream's Makefile changed and our Makefile has been
#                      reviewed against it; record it as the new reference
#   --allow-downgrade  accept a pkgver that sorts lower than the current one
#   KDIR=/path/to/kernel/build selects the kernel for the compile check
#   (default: the running kernel).

set -euo pipefail

cd "$(dirname "$(readlink -f "$0")")"
up=linux-ntfs
build=1
accept_makefile=0
allow_downgrade=0
for arg in "$@"; do
	case $arg in
	--no-build) build=0 ;;
	--accept-makefile) accept_makefile=1 ;;
	--allow-downgrade) allow_downgrade=1 ;;
	*) echo "error: unknown argument $arg" >&2; exit 1 ;;
	esac
done

if [ ! -e "$up/.git" ]; then
	echo "error: submodule $up is not checked out (git submodule update --init)" >&2
	exit 1
fi
if [ -n "$(git -C "$up" status --porcelain)" ]; then
	echo "error: $up has local changes; keep it pristine and put changes in patches/" >&2
	exit 1
fi

commit=$(git -C "$up" rev-parse HEAD)

# Upstream rebases ntfs-next, so a commit count can shrink between syncs.
# The committer date of the tip moves forward on every rebase, so it keeps
# pkgver increasing.
pkgdate=$(TZ=UTC git -C "$up" log -1 --format=%cd --date=format-local:%Y%m%d.%H%M%S)
pkgver="1.0.$pkgdate.g${commit:0:7}"
old_pkgver=$(sed -n 's/^pkgver=//p' PKGBUILD)
if [ "$(vercmp "$pkgver" "$old_pkgver")" -lt 0 ] && [ "$allow_downgrade" = 0 ]; then
	echo "error: new pkgver $pkgver sorts before current $old_pkgver" >&2
	echo "       (older upstream checkout?) rerun with --allow-downgrade if intended" >&2
	exit 1
fi

# Our Makefile is maintained by hand, so check it still matches upstream's.
# 1. It must build exactly the objects upstream builds (lib/ flattened).
#    WOF is always enabled here, so upstream's conditional objects count too.
upobjs=$(grep -oE '[A-Za-z0-9_/-]+\.o' "$up/Makefile" | grep -vx 'ntfs\.o' |
	sed 's|.*/||' | sort -u)
ourobjs=$(sed -n '/^ntfsplus-y/,/[^\\]$/p' Makefile | grep -oE '[A-Za-z0-9_-]+\.o' | sort -u)
if [ "$upobjs" != "$ourobjs" ]; then
	echo "error: object list in Makefile differs from $up/Makefile:" >&2
	diff <(echo "$ourobjs") <(echo "$upobjs") | sed -n 's/^</  only ours:     /p; s/^>/  only upstream: /p' >&2
	exit 1
fi
# 2. Any other upstream Makefile change (flags, config options) needs a
#    human look. upstream-Makefile.ref is the version last reviewed.
if ! cmp -s "$up/Makefile" upstream-Makefile.ref; then
	if [ "$accept_makefile" = 1 ]; then
		cp "$up/Makefile" upstream-Makefile.ref
		echo "recorded $up/Makefile as the reviewed reference"
	else
		echo "error: $up/Makefile changed since the last reviewed sync:" >&2
		diff -u upstream-Makefile.ref "$up/Makefile" >&2 || true
		echo "       port relevant changes to Makefile, then rerun with --accept-makefile" >&2
		exit 1
	fi
fi

mapfile -t upfiles < <(git -C "$up" ls-files -- '*.c' '*.h' Kconfig | sort)
mapfile -t flat < <(printf '%s\n' "${upfiles[@]##*/}" | sort)
dups=$(printf '%s\n' "${flat[@]}" | uniq -d)
if [ -n "$dups" ]; then
	echo "error: upstream files collide once lib/ is flattened: $dups" >&2
	exit 1
fi

# Drop files that upstream no longer has.
mapfile -t old < <(bash -c 'source ./PKGBUILD && printf "%s\n" "${_upstream[@]}"')
for f in "${old[@]}"; do
	[ -n "$f" ] || continue
	if ! printf '%s\n' "${flat[@]}" | grep -qxF "$f"; then
		echo "removing $f (gone upstream)"
		git rm -q --ignore-unmatch -- "$f"
		rm -f -- "$f"
	fi
done

echo "copying ${#upfiles[@]} files from $up @ ${commit:0:12}"
for f in "${upfiles[@]}"; do
	cp -- "$up/$f" "${f##*/}"
done

for p in patches/*.patch; do
	echo "applying $p"
	if ! patch -p1 --forward --fuzz=0 --no-backup-if-mismatch \
			--reject-file=- --quiet < "$p"; then
		echo "error: $p does not apply; refresh it against $up @ ${commit:0:12}" >&2
		exit 1
	fi
done

# Rewrite the generated parts of PKGBUILD.
list=$(printf '          %s\n' "${flat[@]}")
awk -v list="$list" '
	/^# BEGIN upstream sources/ { print; print "_upstream=("; print list; print ")"; skip = 1; next }
	/^# END upstream sources/   { skip = 0 }
	!skip
' PKGBUILD > PKGBUILD.new
sed -i -e "s/^_upstream_commit=.*/_upstream_commit=$commit/" \
       -e "s/^pkgver=.*/pkgver=$pkgver/" PKGBUILD.new
[ "$old_pkgver" = "$pkgver" ] || sed -i 's/^pkgrel=.*/pkgrel=1/' PKGBUILD.new
mv PKGBUILD.new PKGBUILD
updpkgsums >/dev/null 2>&1 || { echo "error: updpkgsums failed" >&2; exit 1; }
echo "PKGBUILD: pkgver=$pkgver"

[ "$build" = 1 ] || exit 0

tmp=$(mktemp -d)
trap 'rm -rf -- "$tmp"' EXIT
bash -c 'source ./PKGBUILD && printf "%s\n" "${source[@]}"' | xargs cp -t "$tmp" --
chmod +x "$tmp/find-objtool.sh"
kdir=${KDIR:-/lib/modules/$(uname -r)/build}
krel=$(cat "$kdir/include/config/kernel.release")
echo "compile check against $kdir"
# Invoke make the way DKMS does (see make.log of a DKMS build), so problems
# in the outer Makefile show up here rather than at install time.
if ! (cd "$tmp" && make -j"$(nproc)" KERNELRELEASE="$krel" default \
		KDIR="$kdir") > "$tmp/build.log" 2>&1; then
	cat "$tmp/build.log" >&2
	echo "error: compile check failed" >&2
	exit 1
fi
warnings=$(grep -c 'warning:' "$tmp/build.log" || true)
grep 'warning:' "$tmp/build.log" >&2 || true
echo "compile check passed ($warnings warnings): $(du -h "$tmp/ntfsplus.ko" | cut -f1) ntfsplus.ko"
