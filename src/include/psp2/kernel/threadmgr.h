/**
 * \file
 * \brief Header file related to thread management
 *
 * Copyright (C) 2015 PSP2SDK Project
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License version 2.1 as published by the Free Software Foundation
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  021100xFFFFFAEB  USA
 */

#ifndef _PSP2_KERNEL_THREADMGR_H_
#define _PSP2_KERNEL_THREADMGR_H_

#include <psp2/types.h>

enum {
	PSP2_THREAD_ATTR_USER = 0x80000000
};

SceUID sceKernelCreateThread(const char *name, void *entry,
	unsigned int initPriority, SceSize stackSize, unsigned attr,
	int affinity, const void *option);
int sceKernelStartThread(SceUID thid, SceSize arglen, void *argp);
int sceKernelDeleteThread(SceUID thid);

#endif
