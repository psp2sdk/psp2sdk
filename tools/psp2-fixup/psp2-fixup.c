/*
 * Copyright (C) 2015 PSP2SDK Project
 *
 * This program is free software; you can redistribute it and/or
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
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 */

#include <stdio.h>
#include <errno.h>
#include "elf_priv.h"
#include "stub.h"

int main(int argc, char *argv[])
{
	elf_t elf;
	char *src, *dst;
	int res;

	if (argc != 3) {
		fprintf(stderr, "%s: Usage <INPUT> <OUTPUT>\n", argv[0]);
		return EINVAL;
	}

	src = argv[1];
	dst = argv[2];

	res = openElf(&elf, src);
	if (res)
		return res;

	res = updateElf(&elf);
	if (res)
		goto fail;

	res = buildStubs(&elf.stubContents, &elf.sceScns,
		elf.fp, elf.scns, elf.strtab.content, elf.symtab.content);
	if (res)
		goto fail;

	res = writeElf(dst, &elf);
	if (res)
		goto fail;

	return closeElf(&elf);

fail:
	closeElf(&elf);
	return res;
}
