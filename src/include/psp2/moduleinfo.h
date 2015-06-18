/**
 * \file
 * \brief Header file related to module information definitions
 *
 * Copyright (C) 2015 PSP2SDK Project
 *
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef _PSP2_MODULEINFO_H_
#define _PSP2_MODULEINFO_H_

#include <psp2/types.h>
#include <stddef.h>
#include <stdint.h>

//! Module Information
typedef struct {
	uint16_t attr;	//!< Attribute
	uint16_t ver;	//!< Version
	char name[27];	//!< Name
	uint8_t type;	//!< Type
	void *gp;	//!< Global Pointer
	void *expTop;	//!< Pointer to the top of export table
	void *expBtm;	//!< Pointer to the bottom of export table
	void *impTop;	//!< Pointer to the top of import table
	void *impBtm;	//!< Pointer to the bottom of import table
	uint32_t nid;	//!< NID
	uint32_t unk38;	//!< Unknown
	uint32_t unk3C;	//!< Unknown
	uint32_t unk40;	//!< Unknown
	void *start;	//!< Pointer to module_start function
	void *stop;	//!< Pointer to module_stop function
	void *exidxTop;	//!< Pointer to the top of exidx section
	void *exidxBtm;	//!< Pointer to the bottom of exidx section
	void *extabTop;	//!< Pointer to the top of extab section
	void *extabBtm;	//!< Pointer to the bottom of extab section
} _sceModuleInfo;

//! The type of structure stored in .sceModuleInfo.rodata section
typedef const _sceModuleInfo SceModuleInfo;

// It doesn't refer to import_btm because it is not defined yet.
/**
 * Define module information
 *
 * \param attribute Attribute
 * \param version Version
 * \param module_name Name
 */
#define PSP2_MODULE_INFO(attribute, version, module_name)	\
	__asm__ (".section .sceLib.stub, \"a\", %progbits;");	\
	extern char export_top[], export_btm[];	\
	extern char import_top[];	\
	int module_start(SceSize argc, void *argp);	\
	int module_stop(SceSize argc, void *argp);	\
	extern char exidx_top[], exidx_btm[];	\
	extern char extab_top[], extab_btm[];	\
	SceModuleInfo module_info	\
		__attribute__((section(".sceModuleInfo.rodata"), aligned(16)))	\
			= {	\
		.attr = attribute,	\
		.ver = version,	\
		.name = module_name,	\
		.type = 0,	\
		.gp = NULL,	\
		.expTop = export_top,	\
		.expBtm = export_btm,	\
		.impTop = import_top,	\
		.impBtm = import_top,	\
		.nid = 0,	\
		.start = module_start,	\
		.stop = module_stop,	\
		.exidxTop = exidx_top,	\
		.exidxBtm = exidx_btm,	\
		.extabTop = extab_top,	\
		.extabBtm = extab_btm	\
	};

#endif
