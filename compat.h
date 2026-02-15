/* SPDX-License-Identifier: GPL-2.0 */
/*
 * Compatibility layer for kernel API changes
 */

#ifndef _NTFSPLUS_COMPAT_H
#define _NTFSPLUS_COMPAT_H

#include <linux/version.h>
#include <linux/fs.h>
#include <linux/iomap.h>

#if LINUX_VERSION_CODE < KERNEL_VERSION(6, 13, 0)
/*
 * inode_state_read_once() / inode_state_set() were added during the 6.13
 * development cycle. Guard with a version check; #ifndef does not work
 * for inline functions (only macros).
 */
static inline unsigned long inode_state_read_once(struct inode *inode)
{
	return READ_ONCE(inode->i_state);
}

static inline void inode_state_set(struct inode *inode, unsigned long flags)
{
	WRITE_ONCE(inode->i_state, inode->i_state | flags);
}
#endif

#if LINUX_VERSION_CODE < KERNEL_VERSION(6, 19, 0)
/*
 * iomap_bio_read_folio() / iomap_bio_readahead() are inline helpers
 * introduced in 6.19. On older kernels, forward to the bare iomap API.
 * These are macros/inlines in 6.19+ so a #ifndef guard is insufficient;
 * use a version check instead.
 */
static inline void iomap_bio_read_folio(struct folio *folio,
					const struct iomap_ops *ops)
{
	iomap_read_folio(folio, ops);
}

static inline void iomap_bio_readahead(struct readahead_control *rac,
					const struct iomap_ops *ops)
{
	iomap_readahead(rac, ops);
}
#endif

#include <linux/posix_acl_xattr.h>

/*
 * The posix_acl_to_xattr API changed in some 6.19 kernels and will be
 * standardized in 7.0+. Old API returns int, new API returns void*.
 * We must be extremely careful to ensure both code paths are syntactically
 * valid regardless of which API is present, since the compiler type-checks
 * both branches even when using __builtin_choose_expr.
 */

/* Wrapper for NEW API: posix_acl_to_xattr returns void* */
static inline void *__ntfs_posix_acl_new_api(struct user_namespace *user_ns,
					      const struct posix_acl *acl,
					      size_t *size, gfp_t flags)
{
	/* Call with new API signature */
	void *(*fn)(struct user_namespace *, const struct posix_acl *, size_t *, gfp_t) =
		(void *(*)(struct user_namespace *, const struct posix_acl *, size_t *, gfp_t))
		(void *)posix_acl_to_xattr;
	return fn(user_ns, acl, size, flags);
}

/* Wrapper for OLD API: posix_acl_to_xattr returns int */
static inline void *__ntfs_posix_acl_old_api(struct user_namespace *user_ns,
					      const struct posix_acl *acl,
					      size_t *size, gfp_t flags)
{
	/* Call with old API signature */
	int (*fn)(struct user_namespace *, const struct posix_acl *, void *, size_t) =
		(int (*)(struct user_namespace *, const struct posix_acl *, void *, size_t))
		(void *)posix_acl_to_xattr;
	int ret;
	void *buf;

	*size = posix_acl_xattr_size(acl->a_count);
	buf = kmalloc(*size, flags);
	if (!buf)
		return NULL;

	ret = fn(user_ns, acl, buf, *size);
	if (ret < 0) {
		kfree(buf);
		return NULL;
	}
	return buf;
}

/* Select correct wrapper at compile time */
#define ntfs_posix_acl_to_xattr(user_ns, acl, size, flags) \
	__builtin_choose_expr( \
		__builtin_types_compatible_p(typeof(posix_acl_to_xattr(NULL, NULL, NULL, 0)), void *), \
		__ntfs_posix_acl_new_api(user_ns, acl, size, flags), \
		__ntfs_posix_acl_old_api(user_ns, acl, size, flags) \
	)

/* EFSCORRUPTED was removed from uapi/asm-generic/errno.h in 6.19.3 stable;
 * it is now only defined inside linux/jbd2.h. Provide the alias here. */
#ifndef EFSCORRUPTED
#define EFSCORRUPTED EUCLEAN /* Filesystem is corrupted */
#endif

/* Shutdown flags not always defined in generic headers */
#ifndef FS_SHUTDOWN_FLAGS_DEFAULT
#define FS_SHUTDOWN_FLAGS_DEFAULT	0x0
#endif
#ifndef FS_SHUTDOWN_FLAGS_LOGFLUSH
#define FS_SHUTDOWN_FLAGS_LOGFLUSH	0x1	/* flush log but not data */
#endif
#ifndef FS_SHUTDOWN_FLAGS_NOLOGFLUSH
#define FS_SHUTDOWN_FLAGS_NOLOGFLUSH	0x2	/* don't flush log nor data */
#endif

/* missing FS_IOC_SHUTDOWN definition */
#ifndef FS_IOC_SHUTDOWN
#define FS_IOC_SHUTDOWN		_IOR('X', 125, __u32)
#endif

/*
 * vma_desc_test_flags / VMA_WRITE_BIT: new mm API introduced after 6.19.x
 * stable kernels. On older kernels, fall back to checking desc->vm_flags
 * directly with VM_WRITE.
 *
 * NOTE: This compat only covers the specific use in file.c where
 * vma_desc_test_flags(desc, VMA_WRITE_BIT) is called. If future code
 * uses additional VMA bits, this compat must be extended.
 */
#ifndef vma_desc_test_flags
#include <linux/mm.h>
static inline bool __ntfs_compat_vma_desc_is_write(const struct vm_area_desc *desc)
{
	return !!(desc->vm_flags & VM_WRITE);
}
/* Variadic macro: ignores extra bits, always checks VM_WRITE.
 * Works correctly for our single VMA_WRITE_BIT use case. */
#define vma_desc_test_flags(desc, ...) __ntfs_compat_vma_desc_is_write(desc)
#endif

#endif /* _NTFSPLUS_COMPAT_H */
