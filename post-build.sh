#!/bin/bash
# SPDX-License-Identifier: GPL-2.0
#
# Post-build hook: restore the kernel's original objtool binary if it was
# replaced by pre-build.sh.

set -euo pipefail

kernel_source_dir="/lib/modules/${1}/build"
OBJTOOL="${kernel_source_dir}/tools/objtool/objtool"
BACKUP="${OBJTOOL}.dkms-bak"

if [ -f "${BACKUP}" ]; then
    echo "ntfsplus-dkms: restoring original objtool"
    mv "${BACKUP}" "${OBJTOOL}"
fi
