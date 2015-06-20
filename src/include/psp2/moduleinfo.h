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
	uint32_t expTop;	//!< Offset of the top of export table
	uint32_t expBtm;	//!< Offset of the bottom of export table
	uint32_t impTop;	//!< Offset of the top of import table
	uint32_t impBtm;	//!< Offset of the bottom of import table
	uint32_t nid;	//!< NID
	uint32_t unk[3];	//!< Unknown
	uint32_t start;	//!< Offset of module_start function
	uint32_t stop;	//!< Offset of module_stop function
	uint32_t exidxTop;	//!< Offset of the top of exidx section
	uint32_t exidxBtm;	//!< Offset of the bottom of exidx section
	uint32_t extabTop;	//!< Offset of the top of extab section
	uint32_t extabBtm;	//!< Offset of the bottom of extab section
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
	SceModuleInfo module_info	\
		__attribute__((section(".sceModuleInfo.rodata")))	\
			= {	\
		.attr = attribute,	\
		.ver = version,	\
		.name = module_name,	\
		.type = 0,	\
		.gp = NULL,	\
		.nid = 0,	\
	};

#endif
