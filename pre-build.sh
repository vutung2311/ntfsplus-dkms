#!/bin/bash
# SPDX-License-Identifier: GPL-2.0
#
# Pre-build hook: if the kernel's bundled objtool binary fails to load due to
# a dynamic-linker error (e.g. libsframe ABI mismatch on rc kernels), replace
# it in-place with a working binary from another installed kernel's build tree.
# The original is saved as objtool.dkms-bak and restored by post-build.sh.

set -euo pipefail

kernel_source_dir="/lib/modules/${1}/build"
OBJTOOL="${kernel_source_dir}/tools/objtool/objtool"

# Probe: run with no args; a working binary prints usage (exit 1), a broken
# one gets a dynamic linker error mentioning the missing symbol/library.
if { "${OBJTOOL}" 2>&1 || true; } | grep -q 'libsframe\|version.*not found'; then
    echo "ntfsplus-dkms: objtool at ${OBJTOOL} is incompatible with current" \
         "system libraries; searching for a working replacement..."

    FALLBACK=""
    for candidate in /usr/lib/modules/*/build/tools/objtool/objtool; do
        [ "${candidate}" = "${OBJTOOL}" ] && continue
        if ! "${candidate}" 2>&1 | grep -q 'libsframe\|version.*not found'; then
            FALLBACK="${candidate}"
            break
        fi
    done

    if [ -z "${FALLBACK}" ]; then
        echo "ntfsplus-dkms: WARNING: no working objtool found;" \
             "build may fail." >&2
        exit 0
    fi

    echo "ntfsplus-dkms: using ${FALLBACK} in place of kernel's objtool"
    cp "${OBJTOOL}" "${OBJTOOL}.dkms-bak"
    cp "${FALLBACK}" "${OBJTOOL}"
fi
