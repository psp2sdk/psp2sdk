/**
 * \file
 * \brief Header file which describes the directory entry struct
 *
 * Copyright (C) 2015 PSP2SDK Project
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

#ifndef _PSP2_IO_IOFILEMGR_DIRENT_H_
#define _PSP2_IO_IOFILEMGR_DIRENT_H_

#include <psp2/io/iofilemgr_stat.h>

/** Describes a single directory entry */
typedef struct SceIoDirent {
	/** File status. */
	SceIoStat       d_stat;
	/** File name. */
	char            d_name[256];
	/** Device-specific data. */
	void            *d_private;
	int             dummy;
} SceIoDirent;

#endif
