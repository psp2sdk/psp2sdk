/*
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

#include <psp2/kernel/loadcore.h>
#include <psp2/kernel/threadmgr.h>
#include <psp2/moduleinfo.h>
#include <psp2/types.h>
#include <stddef.h>
#include <stdint.h>

extern const char psp2MainThreadName[] __attribute__((weak));
extern const int psp2MainThreadPriority __attribute__((weak));
extern const SceSize psp2MainThreadStackSize __attribute__((weak));
extern const int psp2MainThreadAttr __attribute__((weak));
extern const int psp2MainThreadAffinity __attribute__((weak));
extern const int psp2MainThreadOption[] __attribute__((weak));

extern SceModuleInfo module_info;

int main(SceSize arglen, void *argp);

static SceUID id;

int module_start(SceSize arglen, void *argp)
{
	id = sceKernelCreateThread(
		&psp2MainThreadName == NULL ? "user_main" : psp2MainThreadName,
		main,
		&psp2MainThreadPriority == NULL ? 32 : psp2MainThreadPriority,
		&psp2MainThreadStackSize == NULL ? 1048576 : psp2MainThreadStackSize,
		&psp2MainThreadAttr == NULL ? PSP2_THREAD_ATTR_USER : psp2MainThreadAttr,
		&psp2MainThreadAffinity == NULL ? 0x70000 : psp2MainThreadAffinity,
		&psp2MainThreadOption);
	return id < 0 ? id : sceKernelStartThread(id, arglen, argp);
}

int module_stop()
{
	return sceKernelTerminateDeleteThread(id);
}

static const uint32_t nids[3] __attribute__((section(".sceExport.rodata")))
	= { 0x935CD196, 0x79F8E492, 0x6C2224BA };

static const uint32_t ents[3] __attribute__((section(".sceExport.rodata")))
	= { (uint32_t)module_start, (uint32_t)module_stop, (uint32_t)&module_info };

static const char name[] __attribute__((section(".sceExport.rodata")))
	= "syslib";

static const SceLibraryEntryTable export
	__attribute__((section(".sceLib.ent"), used)) = {
		.size = sizeof(SceLibraryEntryTable),
		.ver = 0,
		.attr = 0x800,
		.funcNum = 2,
		.varNum = 1,
		.unkNum = 0,
		.nid = 0,
		.name = name,
		.nids = nids,
		.ents = (const void **)ents
	};
