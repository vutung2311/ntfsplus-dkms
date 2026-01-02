/* SPDX-License-Identifier: GPL-2.0 */
/*
 * Compatibility layer for kernel API changes
 */

#ifndef _NTFSPLUS_COMPAT_H
#define _NTFSPLUS_COMPAT_H

#include <linux/version.h>
#include <linux/fs.h>
#include <linux/iomap.h>

#if LINUX_VERSION_CODE < KERNEL_VERSION(6, 19, 0)
#ifndef inode_state_read_once
static inline unsigned long inode_state_read_once(struct inode *inode)
{
	return READ_ONCE(inode->i_state);
}
#endif

#ifndef inode_state_set
static inline void inode_state_set(struct inode *inode, unsigned long flags)
{
	WRITE_ONCE(inode->i_state, inode->i_state | flags);
}
#endif
#endif

#if LINUX_VERSION_CODE < KERNEL_VERSION(6, 19, 0)
#ifndef iomap_bio_read_folio
static inline void iomap_bio_read_folio(struct folio *folio,
					const struct iomap_ops *ops)
{
	iomap_read_folio(folio, ops);
}
#endif

#ifndef iomap_bio_readahead
static inline void iomap_bio_readahead(struct readahead_control *rac,
					const struct iomap_ops *ops)
{
	iomap_readahead(rac, ops);
}
#endif
#endif

#endif /* _NTFSPLUS_COMPAT_H */
