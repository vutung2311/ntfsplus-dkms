#!/bin/bash
# SPDX-License-Identifier: GPL-2.0
#
# Smoke test for the installed ntfsplus module. Run as root:
#   sudo ./smoke-test.sh
#
# Works only on loop devices backed by image files in a fresh temporary
# directory, which it removes on exit. Real disks are never touched.
#
#   1. load ntfsplus next to the in-tree ntfs module (slab/fs name clashes)
#   2. write a mixed workload through ntfsplus on a fresh mkntfs image
#   3. unmount, remount and verify every file's checksum
#   4. use the in-tree ntfs on a second image while ntfsplus is mounted
#   5. check the image with ntfsfix -n and re-read it read-only with the
#      in-tree ntfs and, if loadable (or SMOKE_NTFS3=1), ntfs3
#   6. scan the kernel log for warnings/errors and unload ntfsplus

set -uo pipefail

[ "$(id -u)" = 0 ] || { echo "run as root: sudo $0" >&2; exit 1; }
for t in mkntfs ntfsfix losetup sha256sum python3 setfattr getfattr; do
	command -v "$t" >/dev/null || { echo "missing tool: $t" >&2; exit 1; }
done
modinfo ntfsplus >/dev/null 2>&1 || { echo "ntfsplus module is not installed" >&2; exit 1; }

work=$(mktemp -d /tmp/ntfsplus-smoke.XXXXXX)
loops=()
failures=0
loaded_by_us=0

step() { printf '\n== %s\n' "$*"; }
ok()   { echo "  ok:   $*"; }
bad()  { echo "  FAIL: $*"; failures=$((failures + 1)); }
warn() { echo "  warn: $*"; }
# Not "lsmod | grep -q": under pipefail, grep -q exiting early makes lsmod
# die of SIGPIPE and the pipeline report failure even on a match.
has_module() { grep -q "^$1 " /proc/modules; }

cleanup() {
	cd /
	for m in "$work"/mnt-*; do
		mountpoint -q "$m" 2>/dev/null && umount "$m"
	done
	for l in "${loops[@]}"; do
		losetup -d "$l" 2>/dev/null
	done
	case $work in /tmp/ntfsplus-smoke.*) rm -rf -- "$work" ;; esac
}
trap cleanup EXIT

new_image() { # name size -> prints loop device
	truncate -s "$2" "$work/$1.img"
	mkntfs -F -Q -q -L "$1" "$work/$1.img" >/dev/null 2>&1 || return 1
	losetup -f --show "$work/$1.img"
}

marker="ntfsplus-smoke: start ${work##*/}"
echo "$marker" > /dev/kmsg
echo "work dir: $work"
echo "module:   $(modinfo -F filename ntfsplus) ($(modinfo -F vermagic ntfsplus | cut -d' ' -f1))"

step "1. load ntfsplus next to in-tree ntfs"
if modinfo ntfs >/dev/null 2>&1; then
	modprobe ntfs && ok "in-tree ntfs loaded" || warn "could not load in-tree ntfs"
fi
if has_module ntfsplus; then
	warn "ntfsplus was already loaded; will not unload it at the end"
elif modprobe ntfsplus; then
	loaded_by_us=1
	ok "modprobe ntfsplus"
else
	bad "modprobe ntfsplus failed"
	dmesg | tail -20
	exit 1
fi
grep -E '^(ntfs|ntfsplus|ntfs3) ' /proc/modules | cut -d' ' -f1-3 | sed 's/^/  /'
grep -qw ntfsplus /proc/filesystems && ok "ntfsplus in /proc/filesystems" || bad "ntfsplus not in /proc/filesystems"
[ -e /sys/kernel/slab/ntfsplus_big_inode_cache ] && ok "slab cache ntfsplus_big_inode_cache registered" \
	|| warn "no /sys/kernel/slab/ntfsplus_big_inode_cache (slab sysfs may be off)"

step "2. workload through ntfsplus"
A=$(new_image smoke 512M) && loops+=("$A") || { bad "could not create image"; exit 1; }
mnt=$work/mnt-a
mkdir -p "$mnt"
mount -t ntfsplus "$A" "$mnt" && ok "mounted $A" || { bad "mount -t ntfsplus"; dmesg | tail -20; exit 1; }
cd "$mnt"

run() { # description command...
	if "${@:2}" >/dev/null 2>&1; then ok "$1"; else bad "$1"; fi
}
run "small files, resident and non-resident sizes" bash -c '
	mkdir small && for i in $(seq 0 199); do head -c $((i * 15)) /dev/urandom > small/f$i; done'
run "nested directories" bash -c '
	mkdir -p a/b/c/d/e && for d in a a/b a/b/c a/b/c/d a/b/c/d/e; do head -c 5000 /dev/urandom > $d/data; done'
run "large directory, 3000 entries (index allocation)" bash -c '
	mkdir big && cd big && for i in $(seq 1 3000); do : > "entry-$i"; done'
run "delete 1500 entries from the large directory" bash -c '
	cd big && for i in $(seq 1 2 3000); do rm "entry-$i"; done'
run "64 MiB file with fsync" dd if=/dev/urandom of=large.bin bs=1M count=64 conv=fsync
run "grow resident file to non-resident" bash -c '
	head -c 100 /dev/urandom > grow && head -c 20000 /dev/urandom >> grow'
run "shrink then extend with truncate (hole)" bash -c '
	head -c 3000000 /dev/urandom > trunc && truncate -s 1000000 trunc && truncate -s 9000000 trunc'
run "sparse write at 200 MiB offset" dd if=/dev/urandom of=sparse bs=64K count=4 seek=3200 conv=notrunc
run "overwrite middle of existing file" dd if=/dev/urandom of=large.bin bs=4K count=16 seek=1000 conv=notrunc,fsync
run "mmap write" python3 -c '
import mmap, os
fd = os.open("mmapped", os.O_RDWR | os.O_CREAT)
os.ftruncate(fd, 1 << 20)
m = mmap.mmap(fd, 1 << 20)
m[4096:8192] = os.urandom(4096)
m[-100:] = b"x" * 100
m.flush(); m.close(); os.close(fd)'
run "unicode file name" bash -c 'echo "héllo" > "héllo wörld ✓ 日本.txt"'
run "rename across directories" bash -c 'mv small/f150 a/b/c/renamed && mv a/b/c/d/e a/moved-dir'
run "hard link" ln small/f100 hardlink
run "symlink" ln -s a/b/c/renamed symlink
run "user xattr" bash -c 'setfattr -n user.smoke -v 42 grow && [ "$(getfattr --only-values -n user.smoke grow)" = 42 ]'
sync

manifest=$work/manifest
find . -type f -print0 | sort -z | xargs -0 sha256sum > "$manifest"
find . -type f -printf '%s %p\n' | sort -k2 > "$work/sizes"
readlink symlink > "$work/symlink.target"
echo "  $(wc -l < "$manifest") files recorded"
cd /
umount "$mnt" && ok "umount" || bad "umount"

step "3. remount with ntfsplus and verify"
mount -t ntfsplus "$A" "$mnt" && ok "remounted" || bad "remount"
(cd "$mnt" && sha256sum -c --quiet "$manifest") && ok "all checksums match" || bad "checksum mismatch after remount"
(cd "$mnt" && find . -type f -printf '%s %p\n' | sort -k2) | diff -q - "$work/sizes" >/dev/null \
	&& ok "file sizes match" || bad "file sizes differ after remount"
[ "$(readlink "$mnt/symlink")" = "$(cat "$work/symlink.target")" ] && ok "symlink target" || bad "symlink target"
[ "$(stat -c %h "$mnt/hardlink")" = 2 ] && ok "hard link count 2" || bad "hard link count $(stat -c %h "$mnt/hardlink")"
[ "$(getfattr --only-values -n user.smoke "$mnt/grow" 2>/dev/null)" = 42 ] && ok "xattr persisted" || bad "xattr lost"
[ "$(ls "$mnt/big" | wc -l)" = 1500 ] && ok "large directory has 1500 entries" || bad "large directory has $(ls "$mnt/big" | wc -l) entries"

step "4. in-tree ntfs on a second image while ntfsplus is mounted"
if has_module ntfs; then
	B=$(new_image other 64M) && loops+=("$B")
	mkdir -p "$work/mnt-b"
	if mount -t ntfs "$B" "$work/mnt-b"; then
		head -c 100000 /dev/urandom > "$work/mnt-b/x" && sync && ok "in-tree ntfs mount and write"
		umount "$work/mnt-b" && ok "in-tree ntfs umount" || bad "in-tree ntfs umount"
	else
		bad "mount -t ntfs failed while ntfsplus mounted"
	fi
else
	warn "in-tree ntfs not available, skipped"
fi
umount "$mnt" && ok "umount ntfsplus" || bad "umount ntfsplus"

step "5. external checks"
fix=$(ntfsfix -n "$A" 2>&1)
echo "$fix" | tail -1 | sed 's/^/  ntfsfix: /'
grep -q 'errors:0' <<< "$fix" && ok "ntfsfix -n: no errors" || bad "ntfsfix -n reports problems"

verify_with() { # fstype: mount read-only with another driver, compare data
	mkdir -p "$work/mnt-$1"
	if mount -t "$1" -o ro "$A" "$work/mnt-$1"; then
		(cd "$work/mnt-$1" && sha256sum -c --quiet "$manifest") && ok "$1 reads identical data" \
			|| bad "$1 sees different data"
		umount "$work/mnt-$1"
	else
		bad "$1 refused to mount the volume (dirty or corrupt?)"
	fi
}
if has_module ntfs; then
	verify_with ntfs
else
	warn "in-tree ntfs not available, skipped"
fi
# ntfs3 is an independent implementation, so it is the stronger cross-check.
# Systems that block it via modprobe.d are respected unless SMOKE_NTFS3=1,
# which loads it for this check only (modprobe --ignore-install).
loaded_ntfs3=0
if has_module ntfs3; then
	:
elif [ "${SMOKE_NTFS3:-0}" = 1 ] && modprobe --ignore-install ntfs3; then
	loaded_ntfs3=1
else
	modprobe ntfs3 2>/dev/null
fi
if has_module ntfs3; then
	verify_with ntfs3
	[ "$loaded_ntfs3" = 1 ] && rmmod ntfs3
else
	warn "ntfs3 cannot be loaded (blocked in modprobe.d?); rerun with SMOKE_NTFS3=1 to include it"
fi

step "6. kernel log and unload"
if [ "$loaded_by_us" = 1 ]; then
	rmmod ntfsplus && ok "rmmod ntfsplus" || bad "rmmod ntfsplus"
fi
log=$(dmesg | sed -n "/$marker/,\$p")
problems=$(echo "$log" | grep -iE 'BUG|WARNING|Oops|Call Trace|still has objects|corrupt|error|dirty' || true)
if [ -n "$problems" ]; then
	bad "kernel log has warnings or errors:"
	echo "$problems" | sed 's/^/    /'
else
	ok "no warnings or errors in the kernel log"
fi
echo "  kernel log since start:"
echo "$log" | sed 's/^/    /'

echo
if [ "$failures" = 0 ]; then echo "SMOKE TEST PASSED"; else echo "SMOKE TEST FAILED: $failures check(s)"; fi
exit $((failures > 0))
