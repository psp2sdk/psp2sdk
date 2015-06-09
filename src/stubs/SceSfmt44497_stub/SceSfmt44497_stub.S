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

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceSfmt44497, 0001, 1, 0

PSP2_IMPORT_FUNC SceSfmt44497, 0001, F00, 0x16d8aa5e, sceSfmt44497InitByArray
PSP2_IMPORT_FUNC SceSfmt44497, 0001, F00, 0x1c38322a, sceSfmt44497FillArray32
PSP2_IMPORT_FUNC SceSfmt44497, 0001, F00, 0x908f1122, sceSfmt44497FillArray64
PSP2_IMPORT_FUNC SceSfmt44497, 0001, F00, 0xcf1c8c38, sceSfmt44497InitGenRand
PSP2_IMPORT_FUNC SceSfmt44497, 0001, F00, 0xd411a9a6, sceSfmt44497GenRand64
PSP2_IMPORT_FUNC SceSfmt44497, 0001, F00, 0xf869dfdc, sceSfmt44497GenRand32
