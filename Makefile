# SPDX-License-Identifier: GPL-2.0
#
# Makefile for the ntfsplus filesystem support (out-of-tree DKMS build)
#
# This file is owned by the packaging repo; sync-upstream.sh does not
# overwrite it. The driver sources are copied from the linux-ntfs submodule
# (lib/ flattened into this directory) and patched with patches/*.patch.
#

# kbuild part. Deliberately unconditional: DKMS passes KERNELRELEASE on the
# command line, so the usual "ifneq ($(KERNELRELEASE),)" test cannot tell
# the outer make from kbuild's.

ccflags-y += -Wint-to-pointer-cast \
	$(call cc-option,-Wunused-but-set-variable,-Wunused-const-variable) \
	$(call cc-option,-Wold-style-declaration,-Wout-of-line-declaration)

obj-m += ntfsplus.o

ntfsplus-y := aops.o attrib.o collate.o dir.o file.o index.o inode.o \
	  mft.o mst.o namei.o runlist.o super.o unistr.o attrlist.o ea.o \
	  upcase.o bitmap.o lcnalloc.o logfile.o reparse.o compress.o \
	  iomap.o debug.o sysctl.o object_id.o bdev-io.o \
	  wof.o decompress_common.o lzx_decompress.o xpress_decompress.o

ccflags-$(CONFIG_NTFS_DEBUG) += -DDEBUG
ccflags-$(CONFIG_FS_POSIX_ACL) += -DCONFIG_NTFS_FS_POSIX_ACL=1
ccflags-y += -DCONFIG_NTFS_FS_WOF_COMPRESSION

# Outer part, when called from the command line or by DKMS. kbuild always
# sets obj= when it reads this file.
ifeq ($(obj),)

KVER ?= $(or $(KERNELRELEASE),$(shell uname -r))
KDIR ?= /lib/modules/$(KVER)/build
PWD := $(shell pwd)

# Clang-built kernels need LLVM=1 for external modules too.
ifeq ($(shell grep -qs '^CONFIG_CC_IS_CLANG=y' $(KDIR)/.config && echo 1),1)
KBUILD_ARGS += LLVM=1
endif

# If the kernel's objtool cannot run on this system (e.g. a libsframe ABI
# mismatch on rc kernels), point kbuild at a working one. The override is
# a command-line variable, so the kernel headers package is not modified.
OBJTOOL_FALLBACK := $(shell $(PWD)/find-objtool.sh $(KDIR))
ifneq ($(OBJTOOL_FALLBACK),)
KBUILD_ARGS += objtool=$(OBJTOOL_FALLBACK)
endif

default:
	$(MAKE) -C $(KDIR) M=$(PWD) $(KBUILD_ARGS) modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) $(KBUILD_ARGS) clean

.PHONY: default clean
endif
