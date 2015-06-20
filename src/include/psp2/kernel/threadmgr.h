/**
 * \file
 * \brief Header file related to thread management
 *
 * Copyright (C) 2015 PSP2SDK Project
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
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
