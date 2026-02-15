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
 * vma_desc_test_flags() and vma_desc_test_all() were added as part of the
 * mm VMA descriptor API. Include mm.h first so the preprocessor can see
 * whether they're already defined before the #ifndef guards are evaluated.
 */
#include <linux/mm.h>

#ifndef vma_desc_test_flags
#define vma_desc_test_flags(desc, ...) \
	vma_flags_test(&(desc)->vma_flags, __VA_ARGS__)
#endif

#ifndef vma_desc_test_all
#define vma_desc_test_all(desc, ...) \
	vma_flags_test_all(&(desc)->vma_flags, __VA_ARGS__)
#endif
/*
 * find_inode_nowait() callback hashval type changed from unsigned long to u64
 * in kernel 7.1. Use ntfs_ino_t to select the correct type so the callback
 * signature always matches the kernel declaration without a type-mismatch
 * warning on either version.
 */
#if LINUX_VERSION_CODE < KERNEL_VERSION(7, 1, 0)
typedef unsigned long ntfs_ino_t;
#else
typedef u64 ntfs_ino_t;
#endif

/*
 * iomap_read_ops.submit_read gained a leading 'const struct iomap_iter *'
 * parameter in kernel 7.1.  Use NTFS_SUBMIT_READ_PARAMS in the function
 * definition and NTFS_SUBMIT_READ_CTX to access the ctx argument portably.
 */
#if LINUX_VERSION_CODE < KERNEL_VERSION(7, 1, 0)
#define NTFS_SUBMIT_READ_PARAMS	struct iomap_read_folio_ctx *ctx
#define NTFS_SUBMIT_READ_CTX	ctx
#else
#define NTFS_SUBMIT_READ_PARAMS	const struct iomap_iter *iter, \
				struct iomap_read_folio_ctx *ctx
#define NTFS_SUBMIT_READ_CTX	ctx
#endif

#endif /* _NTFSPLUS_COMPAT_H */
