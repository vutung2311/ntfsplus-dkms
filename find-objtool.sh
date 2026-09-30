#!/bin/bash
# SPDX-License-Identifier: GPL-2.0
#
# Usage: find-objtool.sh <kernel build dir>
#
# Prints nothing if the kernel's own objtool runs (or the kernel has none).
# If it fails to start because of a dynamic-linker error (exit 126/127,
# e.g. a libsframe ABI mismatch on rc kernels), prints the path of a working
# objtool from another installed kernel, newest version first. Diagnostics
# go to stderr so the Makefile only captures the path.

kdir=${1:?usage: find-objtool.sh <kernel build dir>}
own="$kdir/tools/objtool/objtool"

# A working objtool run without arguments prints usage and exits 129.
# The dynamic linker exits 127 when a library or symbol version is missing.
runs() {
	[ -x "$1" ] || return 1
	"$1" >/dev/null 2>&1
	local rc=$?
	[ "$rc" -ne 126 ] && [ "$rc" -ne 127 ]
}

[ -e "$own" ] || exit 0
runs "$own" && exit 0

own_real=$(realpath "$own")
for candidate in $(ls -d /usr/lib/modules/*/build/tools/objtool/objtool 2>/dev/null | sort -rV); do
	[ "$(realpath "$candidate")" = "$own_real" ] && continue
	if runs "$candidate"; then
		echo "ntfsplus: $own does not run on this system; using $candidate" >&2
		echo "$candidate"
		exit 0
	fi
done

echo "ntfsplus: WARNING: $own does not run and no working objtool was found; build may fail" >&2
exit 0
