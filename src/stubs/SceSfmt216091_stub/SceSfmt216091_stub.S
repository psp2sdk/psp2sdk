@ Copyright (C) 2015 PSP2SDK Project
@
@ This library is free software; you can redistribute it and/or
@ modify it under the terms of the GNU Lesser General Public
@ License version 2.1 as published by the Free Software Foundation
@
@ This library is distributed in the hope that it will be useful,
@ but WITHOUT ANY WARRANTY; without even the implied warranty of
@ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
@ Lesser General Public License for more details.
@
@ You should have received a copy of the GNU Lesser General Public
@ License along with this library; if not, write to the Free Software
@ Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

#include <psp2import.S>

PSP2_IMPORT_HEAD 0x0, SceSfmt216091, 0001, 1, 0

PSP2_IMPORT_FUNC SceSfmt216091, 0001, F00, 0x23369abf, sceSfmt216091GenRand64
PSP2_IMPORT_FUNC SceSfmt216091, 0001, F00, 0x4a972dcd, sceSfmt216091GenRand32
PSP2_IMPORT_FUNC SceSfmt216091, 0001, F00, 0x86dde4a7, sceSfmt216091InitGenRand
PSP2_IMPORT_FUNC SceSfmt216091, 0001, F00, 0xa1ce5628, sceSfmt216091FillArray64
PSP2_IMPORT_FUNC SceSfmt216091, 0001, F00, 0xa9cf6616, sceSfmt216091InitByArray
PSP2_IMPORT_FUNC SceSfmt216091, 0001, F00, 0xdd4256f0, sceSfmt216091FillArray32
