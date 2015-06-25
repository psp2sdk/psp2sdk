/**
 * \file
 * \brief Header file which defines file control options
 *
 * Copyright (C) 2015 PSP2SDK Project
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

#ifndef _PSP2_IO_IOFILEMGR_FCNTL_H_
#define _PSP2_IO_IOFILEMGR_FCNTL_H_

/* Note: Not all of these sceIoOpen() flags are not compatible with the
   open() flags found in sys/unistd.h. */
#define PSP2_O_RDONLY   0x0001
#define PSP2_O_WRONLY   0x0002
#define PSP2_O_RDWR     (PSP2_O_RDONLY | PSP2_O_WRONLY)
#define PSP2_O_NBLOCK   0x0004
#define PSP2_O_DIROPEN  0x0008  // Internal use for dopen
#define PSP2_O_APPEND   0x0100
#define PSP2_O_CREAT    0x0200
#define PSP2_O_TRUNC    0x0400
#define	PSP2_O_EXCL     0x0800
#define PSP2_O_NOWAIT   0x8000

#define PSP2_SEEK_SET   0
#define PSP2_SEEK_CUR   1
#define PSP2_SEEK_END   2

#endif
