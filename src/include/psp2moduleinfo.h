/*
 * Copyright (C) 2015 PSP2SDK Project
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 */

#ifndef _PSP2MODULEINFO_H_
#define _PSP2MODULEINFO_H_

#include <psp2types.h>
#include <stddef.h>
#include <stdint.h>

typedef struct {
	uint16_t attr;
	uint16_t ver;
	char name[27];
	uint8_t type;
	void *gp;
	void *expTop;
	void *expBtm;
	void *impTop;
	void *impBtm;
	uint32_t nid;
	uint32_t unk38;
	uint32_t unk3C;
	uint32_t unk40;
	void *start;
	void *stop;
	void *exidxTop;
	void *exidxBtm;
	void *extabTop;
	void *extabBtm;
} _sceModuleInfo;

typedef const _sceModuleInfo SceModuleInfo;

/* It doesn't refer to import_btm because it is not defined yet. */ 
#define PSP2_MODULE_INFO(attribute, version, module_name) \
	extern char export_top[], export_btm[]; \
	extern char import_top[]; \
	int module_start(SceSize argc, void *argp); \
	int module_stop(SceSize argc, void *argp); \
	extern char exidx_top[], exidx_btm[]; \
	extern char extab_top[], extab_btm[]; \
	SceModuleInfo module_info \
		__attribute__((section(".sceModuleInfo.rodata"), aligned(16))) \
			= { \
		.attr = attribute, \
		.ver = version, \
		.name = module_name, \
		.type = 0, \
		.gp = NULL, \
		.expTop = export_top, \
		.expBtm = export_btm, \
		.impTop = import_top, \
		.impBtm = import_top, \
		.nid = 0, \
		.start = module_start, \
		.stop = module_stop, \
		.exidxTop = exidx_top, \
		.exidxBtm = exidx_btm, \
		.extabTop = extab_top, \
		.extabBtm = extab_btm \
	};

#endif
