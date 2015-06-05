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

#include <errno.h>
#include <elf.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#ifndef R_ARM_TARGET1
#define R_ARM_TARGET1 38
#endif

#ifndef R_ARM_TARGET2
#define R_ARM_TARGET2 41
#endif

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

typedef struct {
	Elf32_Addr addrDiff;
	Elf32_Word orgOffset;
	Elf32_Word orgSize;
	Elf32_Half phndx;
	Elf32_Word segOffset;
	Elf32_Shdr shdr;
} scn_t;

typedef struct {
	Elf32_Phdr phdr;
	Elf32_Half shnum;
	scn_t **scns;
} seg_t;

enum {
	ET_SCE_RELEXEC = 0xFE04
};

enum {
	SHT_SCE_RELA = 0x60000000
};

static void *loadScn(FILE *fp, const char *path, const scn_t *scn,
	const char *strtab)
{
	void *p;

	if (fp == NULL || scn == NULL)
		return NULL;

	if (fseek(fp, scn->shdr.sh_offset, SEEK_SET)) {
		if (strtab != NULL)
			perror(strtab + scn->shdr.sh_name);
		else if (path != NULL)
			perror(path);

		return NULL;
	}

	p = malloc(scn->shdr.sh_size);
	if (p == NULL) {
		if (strtab != NULL)
			perror(strtab + scn->shdr.sh_name);
		else if (path != NULL)
			perror(path);

		return NULL;
	}

	if (fread(p, scn->shdr.sh_size, 1, fp) <= 0) {
		if (strtab != NULL)
			perror(strtab + scn->shdr.sh_name);
		else if (path != NULL)
			perror(path);

		free(p);
		return NULL;
	}

	return p;
}

static scn_t *getScns(FILE *fp, const char *path, const Elf32_Ehdr *ehdr)
{
	scn_t *scns;
	Elf32_Half i;

	if (fseek(fp, ehdr->e_shoff, SEEK_SET)) {
		perror(path);
		return NULL;
	}

	scns = malloc(ehdr->e_shnum * sizeof(scn_t));
	if (scns == NULL) {
		perror(NULL);
		return NULL;
	}

	for (i = 0; i < ehdr->e_shnum; i++) {
		if (fread(&scns[i].shdr, sizeof(scns[i].shdr), 1, fp) <= 0) {
			perror(path);
			free(scns);
			return NULL;
		}

		scns[i].orgOffset = scns[i].shdr.sh_offset;
		scns[i].orgSize = scns[i].shdr.sh_size;
	}

	return scns;
}

static void mapOverScnSeg(void (* f)(scn_t *, seg_t *, Elf32_Half),
	scn_t *scns, seg_t *segs, const Elf32_Ehdr *ehdr)
{
	Elf32_Half i, j;
	Elf32_Phdr *phdr;

	for (i = 0; i < ehdr->e_shnum; i++)
		for (j = 0; j < ehdr->e_phnum; j++) {
			phdr = &segs[j].phdr;
			if (phdr->p_offset <= scns[i].shdr.sh_offset
				&& scns[i].shdr.sh_offset + scns[i].shdr.sh_size
					<= phdr->p_offset + phdr->p_filesz) {
				f(scns + i, segs + j, j);
				break;
			}
		}
				
}

static void segCntScns(scn_t *scn, seg_t *seg, Elf32_Half index)
{
	seg->shnum++;
}

static void segCntMapScns(scn_t *scn, seg_t *seg, Elf32_Half index)
{
	scn->phndx = index;
	scn->segOffset = scn->shdr.sh_offset - seg->phdr.p_offset;

	seg->scns[seg->shnum] = scn;
	seg->shnum++;
}

/* Load phdrs and scns included in the sections. scns will be sorted. */
static seg_t *getSegs(FILE *fp, const char *path,
	const Elf32_Ehdr *ehdr, const scn_t *scns)
{
	Elf32_Half i, j, k;
	scn_t *tmp;
	seg_t *segs;

	if (fp == NULL || path == NULL || ehdr == NULL || scns == NULL)
		return NULL;

	segs = malloc(ehdr->e_phnum * sizeof(seg_t));
	if (segs == NULL) {
		perror(path);
		return NULL;
	}


	if (fseek(fp, ehdr->e_phoff, SEEK_SET)) {
		perror(path);
		return NULL;
	}

	for (i = 0; i < ehdr->e_phnum; i++) {
		if (fread(&segs[i].phdr, sizeof(segs[i].phdr), 1, fp) <= 0) {
			perror(path);
			free(segs);
			return NULL;
		}

		segs[i].shnum = 0;
	}

	mapOverScnSeg(segCntScns, (scn_t *)scns, segs, ehdr);

	for (i = 0; i < ehdr->e_phnum; i++) {
		segs[i].scns = malloc(segs[i].shnum * sizeof(scn_t));
		if (segs[i].scns == NULL) {
			perror(NULL);

			while (i) {
				i--;
				free(segs[i].scns);
			}

			free(segs);
			return NULL;
		}

		segs[i].shnum = 0;
	}

	mapOverScnSeg(segCntMapScns, (scn_t *)scns, segs, ehdr);

	for (i = 0; i < ehdr->e_phnum; i++) {
		for (j = 1; j < segs[i].shnum; j++) {
			tmp = segs[i].scns[j];
			if (segs[i].scns[j - 1]->shdr.sh_addr > tmp->shdr.sh_addr) {
				k = j;
				do {
					segs[i].scns[k] = segs[i].scns[k - 1];
					k--;
				} while (k > 0 &&
					segs[i].scns[k - 1]->shdr.sh_addr > tmp->shdr.sh_addr);
				segs[i].scns[k] = tmp;
			}
		}
	}

	return segs;
}

static scn_t *getSymtabScn(const char *path, scn_t *scns, Elf32_Half shnum)
{
	while (shnum) {
		if (scns->shdr.sh_type == SHT_SYMTAB)
			return scns;

		scns++;
		shnum--;
	}

	fprintf(stderr, "%s: Symbol Table is not found.\n", path);
	return NULL;
}

static int freeSegs(seg_t *segs, Elf32_Half segnum)
{
	seg_t *p;

	if (segs == NULL)
		return EINVAL;

	p = segs;
	while (segnum) {
		free(p->scns);

		p++;
		segnum--;
	}

	free(segs);
	return 0;
}

static scn_t *findScn(const scn_t *scns, Elf32_Half shnum,
	const char *strtab, const char *name, const char *path)
{
	if (scns == NULL || strtab == NULL || name == NULL || path == NULL)
		return NULL;

	while (shnum) {
		if (!strcmp(strtab + scns->shdr.sh_name, name))
			return (scn_t *)scns;
		scns++;
		shnum--;
	}

	fprintf(stderr, "%s: %s is not found\n", path, name);
	errno = EILSEQ;

	return NULL;
}

static int updateSegs(seg_t *segs, Elf32_Half segnum, const char *strtab)
{
	scn_t *scn;
	seg_t **sorts, *tmp;
	Elf32_Addr addr, newAddr;
	Elf32_Off offset;
	Elf32_Half i, j;
	Elf32_Word and, gap;

	if (segs == NULL || strtab == NULL)
		return EINVAL;

	sorts = malloc(segnum * sizeof(seg_t *));
	if (sorts == NULL) {
		perror(NULL);
		return errno;
	}

	for (i = 0; i < segnum; i++)
		sorts[i] = segs + i;

	for (i = 1; i < segnum; i++) {
		tmp = sorts[i];
		if (sorts[i - 1]->phdr.p_vaddr > tmp->phdr.p_vaddr) {
			j = i;
			do {
				sorts[j] = sorts[j - 1];
				j--;
			} while (j > 0 && sorts[j - 1]->phdr.p_vaddr > tmp->phdr.p_vaddr);
			sorts[j] = tmp;
		}
	}

	addr = sorts[0]->phdr.p_vaddr;
	for (i = 1; i < segnum; i++) {
		and = sorts[i]->phdr.p_align - 1;
		if (addr & and)
			addr = (addr & ~and) + sorts[i]->phdr.p_align;

		sorts[i]->phdr.p_vaddr = addr;
		sorts[i]->phdr.p_memsz -= sorts[i]->phdr.p_filesz;
		sorts[i]->phdr.p_filesz = 0;

		for (j = 0; j < sorts[i]->shnum; j++) {
			scn = sorts[i]->scns[j];
			newAddr = addr;

			gap = addr & (scn->shdr.sh_addralign - 1);
			if (gap)
				newAddr += scn->shdr.sh_addralign - gap;

			gap = newAddr - addr;
			if (gap)
				sorts[i]->phdr.p_filesz += gap;

			/* It doesn't back up sh_type, but it doesn't matter
			   because writeSegs assume sections whose sh_type were
			   SHT_REL */
			if (scn->shdr.sh_type == SHT_REL)
				scn->shdr.sh_type = SHT_SCE_RELA;

			scn->addrDiff = addr - scn->shdr.sh_addr;
			scn->segOffset = addr - sorts[i]->phdr.p_vaddr;
			scn->shdr.sh_addr = addr;

			if (scn->shdr.sh_type == SHT_SCE_RELA
				&& scn->orgSize == scn->shdr.sh_size)
			{
				scn->shdr.sh_size /= sizeof(Elf32_Rel);
				scn->shdr.sh_size *= sizeof(Psp2_Rela_Short);
			}

			sorts[i]->phdr.p_filesz += scn->shdr.sh_size;
			addr += scn->shdr.sh_size;
		}

		sorts[i]->phdr.p_memsz += sorts[i]->phdr.p_filesz;
	}

	for (i = 1; i < segnum; i++) {
		tmp = sorts[i];
		if (sorts[i - 1]->phdr.p_offset > tmp->phdr.p_offset) {
			j = i;
			do {
				sorts[j] = sorts[j - 1];
				j--;
			} while (j > 0 && sorts[j - 1]->phdr.p_offset > tmp->phdr.p_offset);
			sorts[j] = tmp;
		}
	}

	offset = sizeof(Elf32_Ehdr) + sizeof(Elf32_Phdr) * segnum;
	for (i = 0; i < segnum; i++) {
		and = sorts[i]->phdr.p_align - 1;
		if (offset & and)
			offset = (offset & ~and) + sorts[i]->phdr.p_align;

		sorts[i]->phdr.p_offset = offset;

		for (j = 0; j < sorts[i]->shnum; j++) {
			scn = sorts[i]->scns[j];

			scn->shdr.sh_offset = offset + scn->segOffset;
		}

		offset += sorts[i]->phdr.p_filesz;
	}

	for (i = 1; i < segnum; i++) {
		tmp = sorts[i];
		if (sorts[i - 1]->phdr.p_paddr > tmp->phdr.p_paddr) {
			j = i;
			do {
				sorts[j] = sorts[j - 1];
				j--;
			} while (j > 0 && sorts[j - 1]->phdr.p_paddr > tmp->phdr.p_paddr);
			sorts[j] = tmp;
		}
	}

	addr = sorts[0]->phdr.p_paddr;
	for (i = 1; i < segnum; i++) {
		and = sorts[i]->phdr.p_align - 1;
		if (addr & and)
			addr = (addr & ~and) + sorts[i]->phdr.p_align;

		sorts[i]->phdr.p_paddr = addr;
		addr += sorts[i]->phdr.p_memsz;
	}

	return 0;
}

static int updateSymtab(Elf32_Sym *symtab, Elf32_Word size, scn_t *scns)
{
	if (symtab == NULL || scns == NULL)
		return EINVAL;

	while (size) {
		if (symtab->st_shndx != SHN_UNDEF
			&& symtab->st_shndx < SHN_LORESERVE)
		{
			symtab->st_value -= scns[symtab->st_shndx].addrDiff;
		}

		symtab++;
		size -= sizeof(Elf32_Sym);
	}

	return 0;
}

static int updateEhdr(Elf32_Ehdr *ehdr, const char *path,
	seg_t *segs, scn_t *modinfo)
{
	Elf32_Off offset;
	int i, j;

	if (ehdr == NULL || segs == NULL)
		return EINVAL;

	ehdr->e_type = ET_SCE_RELEXEC;

	for (i = 0; i < ehdr->e_phnum || i < 4; i++)
		for (j = 0; j < segs[i].shnum; j++)
			if (segs[i].scns[j] == modinfo)
					goto found;

	fprintf(stderr, "%s: .sceModuleInfo.rodata not found\n", path);
	return EILSEQ;

found:
	offset = modinfo->shdr.sh_offset - segs[i].phdr.p_offset;
	if (offset >= 1 << 30) {
		fprintf(stderr, "%s: .sceModuleInfo.rodata is invalid\n", path);
		return EILSEQ;
	}

	ehdr->e_entry = (i << 30) | offset;

	ehdr->e_phoff = sizeof(Elf32_Ehdr);
	ehdr->e_shoff = 0;
	ehdr->e_shentsize = 0;
	ehdr->e_shnum = 0;
	ehdr->e_shstrndx = 0;

	return 0;
}

static int writeRel(FILE *dstFp, const char *dst,
	FILE *srcFp, const char *src, const scn_t *scn, const seg_t *seg,
	const scn_t *scns, const Elf32_Sym *symtab, const scn_t *modinfo)
{
	Psp2_Rela_Short rela;
	const scn_t *dstScn;
	Elf32_Rel rel;
	const Elf32_Sym *sym;
	Elf32_Word i, j, type;

	if (dstFp == NULL || dst == NULL || srcFp == NULL || src == NULL
		|| scn == NULL || scns == NULL || symtab == NULL)
	{
		return EINVAL;
	}

	dstScn = scns + scn->shdr.sh_info;

	for (i = 0; i < scn->orgSize; i += sizeof(rel)) {
		if (fread(&rel, sizeof(rel), 1, srcFp) <= 0) {
			perror(src);
			return errno;
		}

		type = ELF32_R_TYPE(rel.r_info);
		if (type == R_ARM_NONE || type == R_ARM_TARGET2)
			continue;

		sym = symtab + ELF32_R_SYM(rel.r_info);

		rela.r_short = 1;
		rela.r_symseg = scns[sym->st_shndx].phndx;
		rela.r_code = type;
		rela.r_datseg = dstScn->phndx;

		if (dstScn == modinfo) {
			rela.r_addend = scns[sym->st_shndx].shdr.sh_offset;
			switch (rel.r_offset) {
				case 40: // The bottom of the export table
				case 48: // The bottom of the import table
					rela.r_addend += scns[sym->st_shndx].shdr.sh_size;
				case 36: // The top of the export table
				case 44: // The top of the import table
				break;
			default:
				goto usual;
			}
		} else {
usual:
			rela.r_addend = sym->st_value;
			if (type == R_ARM_ABS32 || type == R_ARM_TARGET1) {
				if (fseek(srcFp, dstScn->orgOffset + rel.r_offset, SEEK_SET)) {
					perror(src);
					return errno;
				}

				if (fread(&j, sizeof(j), 1, srcFp) <= 0) {
					perror(src);
					return errno;
				}

				rela.r_addend += j;
			}
		}

		rela.r_offset = dstScn->segOffset + rel.r_offset;

		if (fwrite(&rela, sizeof(rela), 1, dstFp) != 1) {
			perror(dst);
			return errno;
		}
	}

	return 0;
}

static int addStub(Psp2_Rela_Short *relaFstub, const scn_t *fstub,
	uint32_t *fnid, const Elf32_Rel *relMark, Elf32_Word relMarkSize,
	const void *mark, Elf32_Addr offset,
	const scn_t *scns, const Elf32_Sym *symtab)
{
	const Elf32_Sym *sym;
	Elf32_Word i, type;

	if (relaFstub == NULL || fnid == NULL
		|| relMark == NULL || mark == NULL)
	{
		return EINVAL;
	}

	for (i = 0; i < relMarkSize / sizeof(Elf32_Rel); i++) {
		if (relMark[i].r_offset == offset
			+ offsetof(sce_libgen_mark_stub, stub))
		{
			type = ELF32_R_TYPE(relMark[i].r_info);
			sym = symtab + ELF32_R_SYM(relMark[i].r_info);

			relaFstub->r_short = 1;
			relaFstub->r_symseg = scns[sym->st_shndx].phndx;
			relaFstub->r_code = type;
			relaFstub->r_datseg = fstub->phndx;

			relaFstub->r_addend = sym->st_value;
			if (type == R_ARM_ABS32 || type == R_ARM_TARGET1)
				relaFstub->r_addend
					+= *(uint32_t *)((uintptr_t)mark + relMark[i].r_offset);

			relaFstub->r_offset = fstub->segOffset + relMark[i].r_offset;
		}
	}

	*fnid = *(uint32_t *)((uintptr_t)mark + offset
			+ offsetof(sce_libgen_mark_stub, nid));

	return 0;
}

static int buildStubs(void **relaFstubContent, void **relaStubContent,
	void **fnidContent, void **stubContent, Elf32_Half fstubPhndx,
	scn_t *relaFstub, scn_t *relStub,
	scn_t *fnid, scn_t *fstub, scn_t *stub, scn_t *mark, scn_t *relMark, FILE *srcFp,
	const scn_t *scns, const char *strtab, Elf32_Sym *symtab)
{
	union {
		uint8_t size;
		sce_libgen_mark_head head;
		sce_libgen_mark_stub stub;
	} *markContent, *p;
	sceLib_stub *stubHeads;
	Psp2_Rela_Short *relaFstubEnt, *relaStubEnt;
	Elf32_Off offset, fnidOffset, fstubOffset;
	Elf32_Rel *relMarkContent, *relMarkEnt;
	Elf32_Sym *sym;
	Elf32_Word i, *fnidEnt;

	if (relaFstubContent == NULL || relaStubContent == NULL
		|| fnidContent == NULL || stubContent == NULL
		|| mark == NULL || relMark == NULL
		|| relStub == NULL || fnid == NULL || fstub == NULL
		|| stub == NULL || mark == NULL || srcFp == NULL
		|| scns == NULL || strtab == NULL || symtab == NULL)
	{
		return EINVAL;
	}

	markContent = malloc(mark->shdr.sh_size);
	if (markContent == NULL) {
		perror(strtab + mark->shdr.sh_name);
		return errno;
	}

	relMarkContent = malloc(relMark->orgSize);
	if (relMarkContent == NULL) {
		perror(strtab + relMark->shdr.sh_name);
		return errno;
	}

	*relaFstubContent = malloc(relaFstub->shdr.sh_size);
	if (*relaFstubContent == NULL) {
		perror(strtab + relaFstub->shdr.sh_name);
		return errno;
	}

	*relaStubContent = malloc(relStub->shdr.sh_size);
	if (*relaStubContent == NULL) {
		perror(strtab + relStub->shdr.sh_name);
		return errno;
	}

	*fnidContent = malloc(fnid->shdr.sh_size);
	if (*fnidContent == NULL) {
		perror(strtab + fnid->shdr.sh_name);
		return errno;
	}

	*stubContent = malloc(stub->shdr.sh_size);
	if (*stubContent == NULL) {
		perror(strtab + stub->shdr.sh_name);
		return errno;
	}

	if (fseek(srcFp, mark->orgOffset, SEEK_SET)) {
		perror(strtab + mark->shdr.sh_name);
		return errno;
	}

	if (fread(markContent, mark->shdr.sh_size, 1, srcFp) <= 0) {
		perror(strtab + mark->shdr.sh_name);
		return errno;
	}

	if (fseek(srcFp, relMark->orgOffset, SEEK_SET)) {
		perror(strtab + relMark->shdr.sh_name);
		return errno;
	}

	if (fread(relMarkContent, relMark->orgSize, 1, srcFp) <= 0) {
		perror(strtab + relMark->shdr.sh_name);
		return errno;
	}

	relaFstubEnt = *relaFstubContent;
	relaStubEnt = *relaStubContent;
	fnidEnt = *fnidContent;
	stubHeads = *stubContent;
	relMarkEnt = relMarkContent;
	p = markContent;
	fnidOffset = 0;
	fstubOffset = 0;
	offset = 0;
	while (offset < mark->shdr.sh_size) {
		if (p->size == sizeof(sce_libgen_mark_head)) {
			stubHeads->size = sizeof(sceLib_stub);
			stubHeads->ver = 1;
			stubHeads->flags = 0;
			stubHeads->nid = p->head.nid;

			relaStubEnt->r_short = 1;
			relaStubEnt->r_symseg = fnid->phndx;
			relaStubEnt->r_code = R_ARM_ABS32;
			relaStubEnt->r_datseg = stub->phndx;
			relaStubEnt->r_addend = fnidOffset;
			relaStubEnt->r_offset = mark->segOffset
				+ offset + offsetof(sceLib_stub, funcNids);

			relaStubEnt->r_short = 1;
			relaStubEnt->r_symseg = fstubPhndx;
			relaStubEnt->r_code = R_ARM_ABS32;
			relaStubEnt->r_datseg = stub->phndx;
			relaStubEnt->r_addend = fstubOffset;
			relaStubEnt->r_offset = mark->segOffset
				+ offset + offsetof(sceLib_stub, funcStubs);

			stubHeads->varNids = 0;
			stubHeads->varStubs = 0;
			stubHeads->unkNids = 0;
			stubHeads->unkStubs = 0;

			stubHeads->funcNum = 0;
			stubHeads->varNum = 0;
			stubHeads->unkNum = 0;

			for (i = 0; i < relMark->orgSize / sizeof(Elf32_Rel); i++) {
				sym = symtab + ELF32_R_SYM(relMarkEnt[i].r_info);
				if (sym->st_value != mark->shdr.sh_addr + offset)
					continue;

				addStub(relaFstubEnt, fstub, fnidEnt,
					relMarkContent, relMark->shdr.sh_size,
					markContent,
					relMarkEnt[i].r_offset
						- offsetof(sce_libgen_mark_stub, head),
					scns, symtab);
				relaFstubEnt++;
				fnidEnt++;
				fstubOffset += sizeof(Psp2_Rela_Short);
				fnidOffset += 4;
				stubHeads->funcNum++;
			}

			stubHeads++;
		}

		offset += p->size;
		p = (void *)((uintptr_t)p + p->size);
	}

	free(markContent);
	free(relMarkContent);

	return 0;
}

static int writeScn(FILE *dst, FILE *src, const scn_t *scn, const char *strtab)
{
	void *p;

	if (dst == NULL || src == NULL || scn == NULL)
		return EINVAL;

	if (scn->orgSize == 0)
		return 0;

	p = malloc(scn->orgSize);
	if (p == NULL) {
		perror(strtab + scn->shdr.sh_name);
		return errno;
	}

	if (fread(p, scn->orgSize, 1, src) <= 0) {
		perror(strtab + scn->shdr.sh_name);
		free(p);
		return errno;
	}

	if (fwrite(p, scn->orgSize, 1, dst) != 1) {
		perror(strtab + scn->shdr.sh_name);
		free(p);
		return errno;
	}

	free(p);

	return 0;
}

static int writeSegs(FILE *dstFp, const char *dst,
	FILE *srcFp, const char *src,
	const char *strtab, const Elf32_Sym *symtab,
	const Elf32_Ehdr *ehdr, const scn_t *scns, const seg_t *segs,
	const scn_t *relaFstub, const scn_t *relaStub,
	const scn_t *fnid, const scn_t *stub, const scn_t *modinfo,
	const void *relaFstubContent, const void *relaStubContent,
	const void *fnidContent, const void *stubContent)
{
	Elf32_Half i, j;
	int res;

	if (dstFp == NULL || dst == NULL || srcFp == NULL || src == NULL
		|| ehdr == NULL || scns == NULL || segs == NULL
		|| relaFstub == NULL || relaStub == NULL || stub == NULL
		|| relaFstubContent == NULL || relaStubContent == NULL
		|| stubContent == NULL)
	{
		return EINVAL;
	}

	if (fseek(dstFp, ehdr->e_phoff, SEEK_SET)) {
		perror(dst);
		return errno;
	}

	for (i = 0; i < ehdr->e_phnum; i++)
		if (fwrite(&segs[i].phdr, sizeof(segs[i].phdr), 1, dstFp) != 1) {
			perror(dst);
			return errno;
		}

	for (i = 0; i < ehdr->e_phnum; i++) {
		for (j = 0; j < segs->shnum; j++) {
			if (fseek(srcFp, segs->scns[j]->orgOffset, SEEK_SET)) {
				perror(strtab + segs->scns[j]->shdr.sh_name);
				return errno;
			}

			if (fseek(dstFp, segs->scns[j]->shdr.sh_offset, SEEK_SET)) {
				perror(strtab + segs->scns[j]->shdr.sh_name);
				return errno;
			}

			// Refer to updateSegs
			if (segs->scns[j]->shdr.sh_type == SHT_SCE_RELA) {
				if (segs->scns[j] == relaFstub) {
					if (fwrite(relaFstubContent, relaFstub->shdr.sh_size, 1, dstFp) != 1) {
						perror(strtab + relaFstub->shdr.sh_name);
						res = errno;
					}
				} else if (segs->scns[j] == relaStub) {
					if (fwrite(relaStubContent, relaStub->shdr.sh_size, 1, dstFp) != 1) {
						perror(strtab + relaStub->shdr.sh_name);
						res = errno;
					}
				} else
					res = writeRel(dstFp, dst, srcFp, src,
						segs->scns[j], segs,
						scns, symtab, modinfo);
			} else if (segs->scns[j] == fnid) {
				if (fwrite(fnidContent, fnid->shdr.sh_size, 1, dstFp) != 1) {
					perror(strtab + fnid->shdr.sh_name);
					res = errno;
				}
			} else if (segs->scns[j] == stub) {
				if (fwrite(stubContent, stub->shdr.sh_size, 1, dstFp) != 1) {
					perror(strtab + stub->shdr.sh_name);
					res = errno;
				}
			} else
				res = writeScn(dstFp, srcFp, segs->scns[j], strtab);

			if (res)
				return res;
		}

		segs++;
	}

	return 0;
}

int main(int argc, char *argv[])
{
	scn_t *relMark, *relFstub, *relStub;
	scn_t *fnid, *fstub, *stub, *mark, *symtabScn, *modinfo, *scns;
	seg_t *segs;
	FILE *srcFp, *dstFp;
	Elf32_Ehdr ehdr;
	Elf32_Sym *symtab;
	Elf32_Word headNum;
	void *relaFstubContent, *relaStubContent, *fnidContent, *stubContent;
	char *src, *dst, *strtab;
	int res;

	if (argc != 3) {
		fprintf(stderr, "%s: Usage <INPUT> <OUTPUT>\n", argv[0]);
		return EINVAL;
	}

	src = argv[1];
	dst = argv[2];

	srcFp = fopen(src, "rb");
	if (srcFp == NULL) {
		perror(src);
		return errno;
	}

	dstFp = fopen(dst, "wb");
	if (dstFp == NULL) {
		perror(dst);
		fclose(srcFp);
		return errno;
	}

	if (fread(&ehdr, sizeof(ehdr), 1, srcFp) <= 0) {
		perror(src);
		fclose(srcFp);
		fclose(dstFp);
		return errno;
	}

	scns = getScns(srcFp, src, &ehdr);
	if (scns == NULL) {
		fclose(srcFp);
		fclose(dstFp);
		return errno;
	}

	segs = getSegs(srcFp, src, &ehdr, scns);
	if (segs == NULL) {
		free(scns);
		fclose(srcFp);
		fclose(dstFp);
		return errno;
	}

	strtab = loadScn(srcFp, src, scns + ehdr.e_shstrndx, NULL);
	if (strtab == NULL) {
		free(scns);
		freeSegs(segs, ehdr.e_phnum);
		fclose(srcFp);
		fclose(dstFp);
		return errno;
	}

	symtabScn = getSymtabScn(src, scns, ehdr.e_shnum);
	if (symtabScn == NULL) {
		free(scns);
		freeSegs(segs, ehdr.e_phnum);
		fclose(srcFp);
		fclose(dstFp);
		return errno;
	}

	symtab = loadScn(srcFp, src, symtabScn, strtab);
	if (symtab == NULL) {
		res = errno;
		goto fail;
	}

	relMark = findScn(scns, ehdr.e_shnum, strtab, ".rel.sce_libgen_mark", src);
	if (relMark == NULL) {
		res = errno;
		goto fail;
	}

	mark = scns + relMark->shdr.sh_info;

	relFstub = findScn(scns, ehdr.e_shnum, strtab, ".rel.sceFStub.rodata", src);
	if (relFstub == NULL) {
		res = errno;
		goto fail;
	}

	fstub = scns + relFstub->shdr.sh_info;

	fnid = findScn(scns, ehdr.e_shnum, strtab, ".sceFNID.rodata", src);
	if (fnid == NULL) {
		res = errno;
		goto fail;
	}

	relStub = findScn(scns, ehdr.e_shnum, strtab, ".rel.sceLib.stub", src);
	if (relStub == NULL) {
		res = errno;
		goto fail;
	}

	stub = scns + relStub->shdr.sh_info;

	modinfo = findScn(scns, ehdr.e_shnum, strtab, ".sceModuleInfo.rodata", src);
	if (modinfo == NULL) {
		res = errno;
		goto fail;
	}

	/* mark->sh_size == (the number of the heads) * 24 + (the number of the stubs) * 20
	   fnid->sh_size == (the number of stubs) * 4 */
	headNum = (mark->shdr.sh_size - fnid->shdr.sh_size / 4 * sizeof(sce_libgen_mark_stub))
		/ sizeof(sce_libgen_mark_head);
	relFstub->shdr.sh_size = fstub->shdr.sh_size / 4 * sizeof(Psp2_Rela_Short);
	relStub->shdr.sh_size = headNum * 6 * sizeof(Psp2_Rela_Short);
	stub->shdr.sh_size = headNum * sizeof(sceLib_stub);

	res = updateSegs(segs, ehdr.e_phnum, strtab);
	if (res)
		goto fail;

	res = updateEhdr(&ehdr, src, segs, modinfo);
	if (res)
		goto fail;

	if (fwrite(&ehdr, sizeof(Elf32_Ehdr), 1, dstFp) != 1)
		goto fail;

	res = updateSymtab(symtab, symtabScn->orgSize, scns);

	res = buildStubs(&relaFstubContent, &relaStubContent,
		&fnidContent, &stubContent, fstub->phndx,
		relFstub, relStub, fnid, fstub, stub, mark, relMark,
		srcFp, scns, strtab, symtab);

	res = writeSegs(dstFp, dst, srcFp, src, strtab, symtab,
		&ehdr, scns, segs, relFstub, relStub, fnid, stub, modinfo,
		relaFstubContent, relaStubContent, fnidContent, stubContent);

fail:
	free(scns);
	freeSegs(segs, ehdr.e_phnum);
	free(strtab);
	free(symtab);

	fclose(dstFp);
	fclose(srcFp);

	return res;
}
