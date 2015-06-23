/*
 * Copyright (C) 2015 PSP2SDK Project
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

#include <psp2/kernel/loadcore.h>
#include <psp2/kernel/threadmgr.h>
#include <psp2/moduleinfo.h>
#include <psp2/types.h>
#include <stddef.h>
#include <stdint.h>

extern const char sceUserMainThreadName[] __attribute__((weak));
extern const int sceUserMainThreadPriority __attribute__((weak));
extern const SceSize sceUserMainThreadStackSize __attribute__((weak));
extern const int psp2UserMainThreadAttr __attribute__((weak));
extern const int psp2UserMainThreadAffinity __attribute__((weak));
extern const int psp2UserMainThreadOption[] __attribute__((weak));

extern SceModuleInfo module_info;

int main(int argc, char *argv[]);

static SceUID id;

static int _main(SceSize arglen, void *argp)
{
	SceSize i, j;
	int argc;
	char ***argv;

	argc = 0;
	for (i = 0; i < arglen; i++)
		if (((char *)argp)[i] == '\0')
			argc++;

	argv = __builtin_alloca(sizeof(char *) * argc);

	j = 0;
	(*argv)[j] = argp;
	j++;

	for (i = 0; i < arglen; i++)
		if (((char *)argp)[i] == '\0') {
			(*argv)[j] = (char *)argp + i + 1;

			j++;
			if (j >= argc)
				break;
		}

	return main(argc, *argv);
}

static int module_start(SceSize arglen, void *argp)
{
	return main(arglen, argp);
	id = sceKernelCreateThread(
		&sceUserMainThreadName == NULL ? "user_main" : sceUserMainThreadName,
		_main,
		&sceUserMainThreadPriority == NULL ? 0x10000100 : sceUserMainThreadPriority,
		&sceUserMainThreadStackSize == NULL ? 1048576 : sceUserMainThreadStackSize,
		&psp2UserMainThreadAttr == NULL ? 0 : psp2UserMainThreadAttr,
		&psp2UserMainThreadAffinity == NULL ? 0 : psp2UserMainThreadAffinity,
		&psp2UserMainThreadOption);
	return id < 0 ? id : sceKernelStartThread(id, arglen, argp);
}

static int module_stop()
{
	return sceKernelDeleteThread(id);
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
