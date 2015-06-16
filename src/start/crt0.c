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

#include <psp2/kernel/threadmgr.h>
#include <psp2/types.h>
#include <stddef.h>

__asm__ (
"#include <psp2/export.s>\n"

"PSP2_EXPORT_START\n"
"PSP2_EXPORT_FUNC_START\n"
"PSP2_EXPORT_FUNC 0xD632ACDB, module_start\n"
"PSP2_EXPORT_FUNC 0xCEE8593C, module_stop\n"
"PSP2_EXPORT_FUNC_END\n"

".ifndef psp2MainThreadName\n"
"	.globl	psp2MainThreadName\n"
"	.section	.rodata\n"
"psp2MainThreadName:\n"
"	.string	\"user_main\"\n"
"	.size	psp2MainThreadName, .-psp2MainThreadName\n"
".endif\n"
);

extern const char psp2MainThreadName[];
extern const int psp2MainThreadPriority __attribute__((weak));
extern const SceSize psp2MainThreadStackSize __attribute__((weak));
extern const int psp2MainThreadAttr __attribute__((weak));
extern const int psp2MainThreadAffinity __attribute__((weak));
extern const int psp2MainThreadOption[] __attribute__((weak));

int main(SceSize arglen, void *argp);

static SceUID id;

int module_start(SceSize arglen, void *argp)
{
	id = sceKernelCreateThread(psp2MainThreadName, main,
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
