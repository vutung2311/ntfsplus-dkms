# SPDX-License-Identifier: GPL-2.0
#
# Makefile for the ntfsplus filesystem support (out-of-tree DKMS build)
#

ccflags-y += -Wint-to-pointer-cast \
        $(call cc-option,-Wunused-but-set-variable,-Wunused-const-variable) \
        $(call cc-option,-Wold-style-declaration,-Wout-of-line-declaration)

obj-m += ntfsplus.o

ntfsplus-y := aops.o attrib.o collate.o dir.o file.o index.o inode.o \
	  mft.o mst.o namei.o runlist.o super.o unistr.o attrlist.o ea.o \
	  upcase.o bitmap.o lcnalloc.o logfile.o reparse.o compress.o \
	  iomap.o debug.o sysctl.o quota.o

ccflags-$(CONFIG_NTFS_DEBUG) += -DDEBUG
ccflags-y += -DCONFIG_NTFS_FS_POSIX_ACL

CONFIG_CC_IS_CLANG := $(shell grep -q 'CONFIG_CC_IS_CLANG=y' $(KDIR)/.config && echo 1 || echo 0)
LLVM ?= $(CONFIG_CC_IS_CLANG)

# Only pass LLVM if it's 1, otherwise let the kernel decide
ifeq ($(LLVM),1)
LLVM_OR_EMPTY := LLVM=1
else
LLVM_OR_EMPTY :=
endif

default:
	$(MAKE) -C $(KDIR) M=$(PWD) $(LLVM_OR_EMPTY) modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) $(LLVM_OR_EMPTY) clean
