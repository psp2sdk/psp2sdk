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

#ifndef ELF_PSP2_H
#define ELF_PSP2_H

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
	uint16_t attr;
	uint16_t ver;
	char name[27];
	uint8_t type;
	Elf32_Addr gp;
	uint32_t expTop;
	uint32_t expBtm;
	uint32_t impTop;
	uint32_t impBtm;
	uint32_t nid;
	uint32_t unk[3];
	uint32_t start;
	uint32_t stop;
	uint32_t exidxTop;
	uint32_t exidxBtm;
	uint32_t extabTop;
	uint32_t extabBtm;
} _sceModuleInfo;

typedef uint64_t Psp2_Rela_Short;

#define PSP2_R_SET_SHORT(rela, isShort) {	\
		*(rela) &= 0xFFFFFFFFFFFFFFF0;	\
		*(rela) |= (isShort) ? 1 : 0;	\
	}
#define PSP2_R_SET_SYMSEG(rela, symseg) {	\
		*(rela) &= 0xFFFFFFFFFFFFFF0F;	\
		*(rela) |= (symseg) << 4;	\
	}
#define PSP2_R_SET_TYPE(rela, code) {	\
		*(rela) &= 0xFFFFFFFFFFFF00FF;	\
		*(rela) |= (code) << 8;	\
	}
#define PSP2_R_SET_DATSEG(rela, datseg) {	\
		*(rela) &= 0xFFFFFFFFFFF0FFFF;	\
		*(rela) |= (datseg) << 16;	\
	}

#define PSP2_R_SET_OFFSET(rela, offset) {	\
		*(rela) &= 0xFFF00000000FFFFF;	\
		*(rela) |= (uint64_t)(offset) << 20;	\
	}

#define PSP2_R_SET_ADDEND(rela, addend) {	\
		*(rela) &= 0x000FFFFFFFFFFFFF;	\
		*(rela) |= (uint64_t)(addend) << 52;	\
	}

enum {
	ET_PSP2_RELEXEC = 0xFE04
};

enum {
	SHT_INTERNAL = SHT_NULL,
	SHT_PSP2_RELA = 0x60000000
};

#endif
