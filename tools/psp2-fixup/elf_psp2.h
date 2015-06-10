/*
 * Copyright (C) 2015 PSP2SDK Project
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef _ELF_PSP2_H_
#define _ELF_PSP2_H_

#include <stdint.h>
#include "elf.h"

typedef struct {
		uint8_t size;
		uint8_t unk0[3];
		uint32_t nid;
		uint32_t name;
		uint32_t ver;
		uint32_t unk[2];
} sce_libgen_mark_head;

typedef struct {
	uint8_t size;
	uint8_t unk0[3];
	uint32_t head;
	uint32_t stub;
	uint32_t nid;
	uint32_t nidSym;
} sce_libgen_mark_stub;

typedef struct {
	uint16_t size;
	uint16_t ver;
	uint16_t flags;
	uint16_t funcNum;
	uint16_t varNum;
	uint16_t unkNum;
	uint32_t unused0;
	uint32_t nid;
	uint32_t name;
	uint32_t unused1;
	uint32_t funcNids;
	uint32_t funcStubs;
	uint32_t varNids;
	uint32_t varStubs;
	uint32_t unkNids;
	uint32_t unkStubs;
} sceLib_stub;

typedef struct {
	Elf32_Word r_short : 4;
	Elf32_Word r_symseg : 4;
	Elf32_Word r_code : 8;
	Elf32_Word r_datseg : 4;
	Elf32_Word r_offset : 32;
	Elf32_Word r_addend : 12;
} Psp2_Rela_Short;

enum {
	ET_SCE_RELEXEC = 0xFE04
};

enum {
	SHT_SCE_RELA = 0x60000000
};

#endif
