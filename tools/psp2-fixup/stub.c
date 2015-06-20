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

#include <errno.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include "elf_psp2.h"
#include "elf.h"
#include "rel.h"
#include "stub.h"

static int addStub(Psp2_Rela_Short *relaFstub, const scn_t *fstub,
	uint32_t *fnid, const scn_t *relMark, const scn_t *mark,
	Elf32_Addr offset, const scn_t *scns,
	const char *strtab, const Elf32_Sym *symtab)
{
	const Elf32_Rel *rel;
	const Elf32_Sym *sym;
	Elf32_Word type;
	Elf32_Addr addend;

	if (relaFstub == NULL || fstub == NULL || fnid == NULL
		|| relMark == NULL || relMark->content == NULL
		|| mark == NULL || mark->content == NULL
		|| scns == NULL || symtab == NULL)
	{
		return EINVAL;
	}

	rel = findRelByOffset(relMark,
		offset + offsetof(sce_libgen_mark_stub, stub), strtab);
	if (rel == NULL)
		return errno;

	type = ELF32_R_TYPE(rel->r_info);
	sym = symtab + ELF32_R_SYM(rel->r_info);

	PSP2_R_SET_SHORT(relaFstub, 1);
	PSP2_R_SET_SYMSEG(relaFstub, scns[sym->st_shndx].phndx);
	PSP2_R_SET_TYPE(relaFstub, type);
	PSP2_R_SET_DATSEG(relaFstub, fstub->phndx);
	PSP2_R_SET_OFFSET(relaFstub, rel->r_offset);

	addend = sym->st_value;
	if (type == R_ARM_ABS32 || type == R_ARM_TARGET1)
		addend += *(uint32_t *)((uintptr_t)mark
			+ rel->r_offset - mark->segOffset);

	PSP2_R_SET_ADDEND(relaFstub, addend);

	*fnid = *(uint32_t *)((uintptr_t)mark->content
		+ offset - mark->segOffset
		+ offsetof(sce_libgen_mark_stub, nid));

	return 0;
}

int updateStubs(sceScns_t *sceScns, FILE *fp, const scn_t *scns,
	const char *strtab, Elf32_Sym *symtab)
{
	union {
		uint8_t size;
		sce_libgen_mark_head head;
		sce_libgen_mark_stub stub;
	} *p;
	sceLib_stub *stubHeads;
	Psp2_Rela_Short *relaFstubEnt, *relaStubEnt;
	Elf32_Off offset, fnidOffset, fstubOffset, stubOffset;
	Elf32_Rel *relMarkEnt;
	Elf32_Sym *sym;
	Elf32_Word i, *fnidEnt;
	int res;

	if (sceScns == NULL || fp == NULL
		|| scns == NULL || strtab == NULL || symtab == NULL)
	{
		return EINVAL;
	}

	sceScns->relFstub->content = malloc(sceScns->relFstub->shdr.sh_size);
	if (sceScns->relFstub->content == NULL) {
		perror(strtab + sceScns->relFstub->shdr.sh_name);
		return errno;
	}

	sceScns->relStub->content = malloc(sceScns->relStub->shdr.sh_size);
	if (sceScns->relFstub->content == NULL) {
		perror(strtab + sceScns->relStub->shdr.sh_name);
		return errno;
	}

	sceScns->fnid->content = malloc(sceScns->fnid->shdr.sh_size);
	if (sceScns->fnid->content == NULL) {
		perror(strtab + sceScns->fnid->shdr.sh_name);
		return errno;
	}

	sceScns->stub->content = malloc(sceScns->stub->shdr.sh_size);
	if (sceScns->stub->content == NULL) {
		perror(strtab + sceScns->stub->shdr.sh_name);
		return errno;
	}

	res = loadScn(fp, sceScns->mark,
		strtab + sceScns->mark->shdr.sh_name);
	if (res)
		return res;

	res = loadScn(fp, sceScns->relMark,
		strtab + sceScns->relMark->shdr.sh_name);
	if (res)
		return res;

	relaFstubEnt = sceScns->relFstub->content;
	relaStubEnt = sceScns->relStub->content;
	fnidEnt = sceScns->fnid->content;
	stubHeads = sceScns->stub->content;
	p = sceScns->mark->content;
	fnidOffset = 0;
	fstubOffset = 0;
	stubOffset = 0;
	offset = 0;
	while (offset < sceScns->mark->shdr.sh_size) {
		if (p->size == sizeof(sce_libgen_mark_head)) {
			stubHeads->size = sizeof(sceLib_stub);
			stubHeads->ver = 1;
			stubHeads->flags = 0;
			stubHeads->nid = p->head.nid;

			PSP2_R_SET_SHORT(relaStubEnt, 1);
			PSP2_R_SET_SYMSEG(relaStubEnt, sceScns->fnid->phndx);
			PSP2_R_SET_TYPE(relaStubEnt, R_ARM_ABS32);
			PSP2_R_SET_DATSEG(relaStubEnt, sceScns->stub->phndx);
			PSP2_R_SET_OFFSET(relaStubEnt, sceScns->stub->segOffset
				+ stubOffset + offsetof(sceLib_stub, funcNids));
			PSP2_R_SET_ADDEND(relaStubEnt, fnidOffset);
			relaStubEnt++;

			PSP2_R_SET_SHORT(relaStubEnt, 1);
			PSP2_R_SET_SYMSEG(relaStubEnt, sceScns->fstub->phndx);
			PSP2_R_SET_TYPE(relaStubEnt, R_ARM_ABS32);
			PSP2_R_SET_DATSEG(relaStubEnt, sceScns->stub->phndx);
			PSP2_R_SET_OFFSET(relaStubEnt, sceScns->stub->segOffset
				+ stubOffset + offsetof(sceLib_stub, funcStubs));
			PSP2_R_SET_ADDEND(relaStubEnt, fstubOffset);
			relaStubEnt++;

			stubHeads->varNids = 0;
			stubHeads->varStubs = 0;
			stubHeads->unkNids = 0;
			stubHeads->unkStubs = 0;

			stubHeads->funcNum = 0;
			stubHeads->varNum = 0;
			stubHeads->unkNum = 0;

			relMarkEnt = sceScns->relMark->content;
			for (i = 0; i < sceScns->relMark->orgSize / sizeof(Elf32_Rel); i++) {
				sym = symtab + ELF32_R_SYM(relMarkEnt->r_info);
				if (sym->st_value != sceScns->mark->shdr.sh_addr + offset)
					continue;

				addStub(relaFstubEnt, sceScns->fstub, fnidEnt,
					sceScns->relMark, sceScns->mark,
					relMarkEnt->r_offset
						- offsetof(sce_libgen_mark_stub, head),
					scns, strtab, symtab);

				relMarkEnt++;
				relaFstubEnt++;
				fnidEnt++;
				fstubOffset += sizeof(Psp2_Rela_Short);
				fnidOffset += 4;
				stubHeads->funcNum++;
			}

			stubOffset += sizeof(sceLib_stub);
			stubHeads++;
		} else if (p->size == 0) {
			printf("%s: Invalid mark\n",
				strtab + sceScns->mark->shdr.sh_name);
			return EILSEQ;
		}

		offset += p->size;
		p = (void *)((uintptr_t)p + p->size);
	}

	sceScns->relFstub->shdr.sh_type = SHT_PSP2_RELA;
	sceScns->relStub->shdr.sh_type = SHT_PSP2_RELA;

	return 0;
}
