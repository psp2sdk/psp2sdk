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

PSP2_IMPORT_HEAD 0x0, SceSfmt1279, 0001, 1, 0

PSP2_IMPORT_FUNC SceSfmt1279, 0001, F00, 0x02e8d906, sceSfmt1279InitGenRand
PSP2_IMPORT_FUNC SceSfmt1279, 0001, F00, 0x9b4a48df, sceSfmt1279GenRand32
PSP2_IMPORT_FUNC SceSfmt1279, 0001, F00, 0xa2c5ee14, sceSfmt1279GenRand64
PSP2_IMPORT_FUNC SceSfmt1279, 0001, F00, 0xc25d9ace, sceSfmt1279InitByArray
PSP2_IMPORT_FUNC SceSfmt1279, 0001, F00, 0xdb3832eb, sceSfmt1279FillArray64
PSP2_IMPORT_FUNC SceSfmt1279, 0001, F00, 0xe7f63838, sceSfmt1279FillArray32
