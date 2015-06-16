/**
 * \file
 * \brief Header file related to module load core
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

#ifndef _PSP2_KERNEL_LOADCORE_
#define _PSP2_KERNEL_LOADCORE_

#include <stdint.h>

typedef struct {
	uint16_t size;
	uint16_t ver;
	uint16_t attr;
	uint16_t funcNum;
	uint32_t varNum;
	uint32_t unkNum;
	uint32_t nid;
	const char *name;
	const uint32_t *nids;
	const void **ents;
} SceLibraryEntryTable;

#endif
