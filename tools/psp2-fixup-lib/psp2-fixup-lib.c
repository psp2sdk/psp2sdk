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

#ifdef __APPLE__
#include <libelf/gelf.h>
#else
#include <elf.h>
#endif
#include <errno.h>
#include <stddef.h>
#include <stdio.h>

int main(int argc, char *argv[])
{
	const Elf32_Half type = 0xFE0C;
	char buf[offsetof(Elf32_Ehdr, e_type)];
	const char *src, *dst;
	FILE *srcFp, *dstFp;
	size_t read;

	if (argc != 3) {
		fprintf(stderr, "Usage: %s <INPUT> <OUTPUT>\n"
			"Copyright (C) 2015 PSP2SDK Project\n"
			"This program is free software; you may redistribute it under the terms of\n"
			"the GNU Lesser General Public License version 2.1.\n"
			"This program has absolutely no warranty.\n", argv[0]);
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
		if (fclose(srcFp))
			perror(src);
		return errno;
	}

	if (fread(buf, sizeof(buf), 1, srcFp) != 1) {
		perror(src);
		goto fail;
	}

	if (fwrite(buf, sizeof(buf), 1, dstFp) != 1) {
		perror(dst);
		goto fail;
	}

	if (fwrite(&type, sizeof(type), 1, dstFp) != 1) {
		perror(dst);
		goto fail;
	}

	if (fseek(srcFp, sizeof(type), SEEK_CUR)) {
		perror(src);
		goto fail;
	}

	do {
		read = fread(buf, 1, sizeof(buf), srcFp);

		if (fwrite(buf, read, 1, dstFp) != 1) {
			perror(dst);
			goto fail;
		}
	} while (read == sizeof(buf));

fail:
	if (fclose(srcFp))
		perror(src);
	if (fclose(dstFp))
		perror(dst);
	return errno;
}
