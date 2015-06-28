/*
 * Copyright (C) 2015 PSP2SDK Project
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

#include <errno.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include "elf_psp2.h"
#include "elf.h"
#include "rel.h"
#include "stub.h"

// stubOffset should be relative to segment
static int addStub(Psp2_Rela *relaStub, const scn_t *stub,
	Elf32_Word *fnid, const scn_t *relMark, const scn_t *mark,
	Elf32_Addr stubOffset, Elf32_Addr stubMarkAddr,
	sce_libgen_mark_stub *stubMark, const scn_t *scns, const seg_t *segs,
	const char *strtab, const Elf32_Sym *symtab)
{
	const Elf32_Rel *rel;
	const Elf32_Sym *sym;
	Elf32_Word type;
	Elf32_Half symseg;
	Elf32_Addr addend;

	if (relaStub == NULL || stub == NULL || fnid == NULL
		|| relMark == NULL || relMark->content == NULL
		|| mark == NULL || mark->content == NULL || stubMark == NULL
		|| scns == NULL || symtab == NULL)
	{
		return EINVAL;
	}

	rel = findRelByOffset(relMark,
		stubMarkAddr + offsetof(sce_libgen_mark_stub, stub), strtab);
	if (rel == NULL)
		return errno;

	type = ELF32_R_TYPE(rel->r_info);
	sym = symtab + ELF32_R_SYM(rel->r_info);
	symseg = scns[sym->st_shndx].phndx;

	PSP2_R_SET_SHORT(relaStub, 0);
	PSP2_R_SET_SYMSEG(relaStub, symseg);
	PSP2_R_SET_TYPE(relaStub, type);
	PSP2_R_SET_DATSEG(relaStub, stub->phndx);
	PSP2_R_SET_OFFSET(relaStub, stubOffset);

	if (type == R_ARM_ABS32 || type == R_ARM_TARGET1) {
		if (mark->content == NULL)
			return EINVAL;

		addend = *(Elf32_Word *)((uintptr_t)mark->content
			+ rel->r_offset - mark->shdr.sh_addr);
	} else
		addend = sym->st_value;

	addend -= segs[symseg].phdr.p_vaddr;
	PSP2_R_SET_ADDEND(relaStub, addend);

	*fnid = stubMark->nid;

	return 0;
}

int updateStubs(sceScns_t *sceScns, FILE *fp,
	const scn_t *scns, const seg_t *segs,
	const char *strtab, Elf32_Sym *symtab)
{
	union {
		uint8_t size;
		sce_libgen_mark_head head;
		sce_libgen_mark_stub stub;
	} *p;
	sce_libgen_mark_stub *stubMark;
	sceLib_stub *stubHeads;
	Psp2_Rela *relaFstubEnt, *relaVstubEnt, *relaStubEnt;
	Elf32_Off fnidOffset, fstubOffset, vnidOffset, vstubOffset;
	Elf32_Off offset, stubOffset;
	Elf32_Rel *rel, *relMarkEnt;
	Elf32_Sym *sym;
	Elf32_Word i, type, stubMarkAddr, *fnidEnt, *vnidEnt;
	Elf32_Half symseg;
	Elf32_Addr addend;
	int res, impFunc, impVar;

	if (sceScns == NULL || fp == NULL || scns == NULL || segs == NULL
		|| strtab == NULL || symtab == NULL)
	{
		return EINVAL;
	}

	sceScns->relStub->content = malloc(sceScns->relStub->shdr.sh_size);
	if (sceScns->relStub->content == NULL) {
		perror(strtab + sceScns->relStub->shdr.sh_name);
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

	if (sceScns->fnid != NULL
		&& sceScns->fstub != NULL && sceScns->relFstub != NULL)
	{
		impFunc = 1;

		sceScns->relFstub->content = malloc(sceScns->relFstub->shdr.sh_size);
		if (sceScns->relFstub->content == NULL) {
			perror(strtab + sceScns->relFstub->shdr.sh_name);
			return errno;
		}

		sceScns->fnid->content = malloc(sceScns->fnid->shdr.sh_size);
		if (sceScns->fnid->content == NULL) {
			perror(strtab + sceScns->fnid->shdr.sh_name);
			return errno;
		}

		relaFstubEnt = sceScns->relFstub->content;
		fnidEnt = sceScns->fnid->content;
		fnidOffset = sceScns->fnid->segOffset;
		fstubOffset = sceScns->fstub->segOffset;
	} else
		impFunc = 0;


	if (sceScns->vnid != NULL
		&& sceScns->vstub != NULL && sceScns->relVstub != NULL)
	{
		impVar = 1;

		sceScns->relVstub->content = malloc(sceScns->relVstub->shdr.sh_size);
		if (sceScns->relVstub->content == NULL) {
			perror(strtab + sceScns->relVstub->shdr.sh_name);
			return errno;
		}

		sceScns->vnid->content = malloc(sceScns->vnid->shdr.sh_size);
		if (sceScns->vnid->content == NULL) {
			perror(strtab + sceScns->vnid->shdr.sh_name);
			return errno;
		}

		relaVstubEnt = sceScns->relVstub->content;
		vnidEnt = sceScns->vnid->content;
		vnidOffset = sceScns->vnid->segOffset;
		vstubOffset = sceScns->vstub->segOffset;
	} else
		impVar = 0;

	relaStubEnt = sceScns->relStub->content;
	stubHeads = sceScns->stub->content;
	p = sceScns->mark->content;
	stubOffset = sceScns->stub->segOffset;
	offset = 0;
	while (offset < sceScns->mark->shdr.sh_size) {
		if (p->size == sizeof(sce_libgen_mark_head)) {
			stubHeads->size = sizeof(sceLib_stub);
			stubHeads->ver = 1;
			stubHeads->flags = 0;
			stubHeads->nid = p->head.nid;

			// Resolve name
			rel = findRelByOffset(sceScns->relMark,
				sceScns->mark->shdr.sh_addr + offset
					+ offsetof(sce_libgen_mark_head, name),
				strtab);
			if (rel == NULL)
				return errno;

			type = ELF32_R_TYPE(rel->r_info);
			sym = symtab + ELF32_R_SYM(rel->r_info);
			symseg = scns[sym->st_shndx].phndx;

			PSP2_R_SET_SHORT(relaStubEnt, 0);
			PSP2_R_SET_SYMSEG(relaStubEnt, symseg);
			PSP2_R_SET_TYPE(relaStubEnt, type);
			PSP2_R_SET_DATSEG(relaStubEnt, sceScns->stub->phndx);
			PSP2_R_SET_OFFSET(relaStubEnt, stubOffset
				+ offsetof(sceLib_stub, name));

			PSP2_R_SET_ADDEND(relaStubEnt,
				(type == R_ARM_ABS32 || type == R_ARM_TARGET1 ?
					sym->st_value : p->head.name)
				- segs[symseg].phdr.p_vaddr);

			relaStubEnt++;

			if (impFunc) {
				// Resolve function NID table
				PSP2_R_SET_SHORT(relaStubEnt, 0);
				PSP2_R_SET_SYMSEG(relaStubEnt, sceScns->fnid->phndx);
				PSP2_R_SET_TYPE(relaStubEnt, R_ARM_ABS32);
				PSP2_R_SET_DATSEG(relaStubEnt, sceScns->stub->phndx);
				PSP2_R_SET_OFFSET(relaStubEnt, stubOffset
					+ offsetof(sceLib_stub, funcNids));
				PSP2_R_SET_ADDEND(relaStubEnt, fnidOffset);
				relaStubEnt++;

				// Resolve function stub table
				PSP2_R_SET_SHORT(relaStubEnt, 0);
				PSP2_R_SET_SYMSEG(relaStubEnt, sceScns->fstub->phndx);
				PSP2_R_SET_TYPE(relaStubEnt, R_ARM_ABS32);
				PSP2_R_SET_DATSEG(relaStubEnt, sceScns->stub->phndx);
				PSP2_R_SET_OFFSET(relaStubEnt, stubOffset
					+ offsetof(sceLib_stub, funcStubs));
				PSP2_R_SET_ADDEND(relaStubEnt, fstubOffset);
				relaStubEnt++;
			} else {
				stubHeads->funcNids = 0;
				stubHeads->funcStubs = 0;
			}

			if (impVar) {
				// Resolve variable NID table
				PSP2_R_SET_SHORT(relaStubEnt, 0);
				PSP2_R_SET_SYMSEG(relaStubEnt, sceScns->vnid->phndx);
				PSP2_R_SET_TYPE(relaStubEnt, R_ARM_ABS32);
				PSP2_R_SET_DATSEG(relaStubEnt, sceScns->stub->phndx);
				PSP2_R_SET_OFFSET(relaStubEnt, stubOffset
					+ offsetof(sceLib_stub, varNids));
				PSP2_R_SET_ADDEND(relaStubEnt, vnidOffset);
				relaStubEnt++;

				// Resolve variable stub table
				PSP2_R_SET_SHORT(relaStubEnt, 0);
				PSP2_R_SET_SYMSEG(relaStubEnt, sceScns->vstub->phndx);
				PSP2_R_SET_TYPE(relaStubEnt, R_ARM_ABS32);
				PSP2_R_SET_DATSEG(relaStubEnt, sceScns->stub->phndx);
				PSP2_R_SET_OFFSET(relaStubEnt, stubOffset
					+ offsetof(sceLib_stub, varStubs));
				PSP2_R_SET_ADDEND(relaStubEnt, vstubOffset);
				relaStubEnt++;
			} else {
				stubHeads->varNids = 0;
				stubHeads->varStubs = 0;
			}

			// TODO: Support other types
			stubHeads->unkNids = 0;
			stubHeads->unkStubs = 0;

			// Resolve nids and stubs
			stubHeads->funcNum = 0;
			stubHeads->varNum = 0;
			stubHeads->unkNum = 0;

			relMarkEnt = sceScns->relMark->content;
			for (i = 0; i < sceScns->relMark->orgSize / sizeof(Elf32_Rel); i++) {
				sym = symtab + ELF32_R_SYM(relMarkEnt->r_info);
				type = ELF32_R_TYPE(relMarkEnt->r_info);

				if (type == R_ARM_ABS32 || type == R_ARM_TARGET1) {
					if (scns + sym->st_shndx != sceScns->mark)
						goto cont;

					addend = *(Elf32_Word *)((uintptr_t)sceScns->mark->content
						+ relMarkEnt->r_offset - sceScns->mark->shdr.sh_addr);
				} else
					addend = sym->st_value;

				if (addend != sceScns->mark->shdr.sh_addr + offset)
					goto cont;

				stubMarkAddr = relMarkEnt->r_offset
					- offsetof(sce_libgen_mark_stub, head);
				stubMark = (void *)((uintptr_t)sceScns->mark->content
					+ stubMarkAddr - sceScns->mark->shdr.sh_addr);
				if (impFunc && stubMark->unk[0] == 1) {
					res = addStub(relaFstubEnt, sceScns->fstub, fnidEnt,
						sceScns->relMark, sceScns->mark,
						fstubOffset, stubMarkAddr,
						stubMark, scns, segs,
						strtab, symtab);
					if (res)
						return res;

					relaFstubEnt++;
					fnidEnt++;
					fstubOffset += sizeof(Elf32_Addr);
					fnidOffset += sizeof(Elf32_Word);
					stubHeads->funcNum++;
				} else if (impVar) {
					res = addStub(relaVstubEnt, sceScns->vstub, vnidEnt,
						sceScns->relMark, sceScns->mark,
						vstubOffset, stubMarkAddr,
						stubMark, scns, segs,
						strtab, symtab);
					if (res)
						return res;

					relaVstubEnt++;
					vnidEnt++;
					vstubOffset += sizeof(Elf32_Addr);
					vnidOffset += sizeof(Elf32_Word);
					stubHeads->varNum++;
				}
cont:
				relMarkEnt++;
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

	if (impFunc)
		sceScns->relFstub->shdr.sh_type = SHT_PSP2_RELA;
	if (impVar)
		sceScns->relVstub->shdr.sh_type = SHT_PSP2_RELA;
	sceScns->relStub->shdr.sh_type = SHT_PSP2_RELA;

	return 0;
}
