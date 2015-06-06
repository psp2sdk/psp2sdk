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

PSP2_IMPORT_HEAD 0x0, SceSfmt132049, 0001, 1, 0

PSP2_IMPORT_FUNC SceSfmt132049, 0001, F00, 0x68ad7866, sceSfmt132049FillArray64
PSP2_IMPORT_FUNC SceSfmt132049, 0001, F00, 0x795f9644, sceSfmt132049GenRand32
PSP2_IMPORT_FUNC SceSfmt132049, 0001, F00, 0xbbd80ac4, sceSfmt132049GenRand64
PSP2_IMPORT_FUNC SceSfmt132049, 0001, F00, 0xd891a99f, sceSfmt132049FillArray32
PSP2_IMPORT_FUNC SceSfmt132049, 0001, F00, 0xdc69294a, sceSfmt132049InitByArray
PSP2_IMPORT_FUNC SceSfmt132049, 0001, F00, 0xdc6b23b0, sceSfmt132049InitGenRand
