@ Copyright (C) 2015 PSP2SDK Project
@
@ This library is free software: you can redistribute it and/or modify
@ it under the terms of the GNU Lesser General Public License as published by
@ the Free Software Foundation, either version 3 of the License, or
@ (at your option) any later version.
@
@ This libary is distributed in the hope that it will be useful,
@ but WITHOUT ANY WARRANTY; without even the implied warranty of
@ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
@ GNU Lesser General Public License for more details.
@
@ You should have received a copy of the GNU Lesser General Public License
@ along with this program.  If not, see <http://www.gnu.org/licenses/>.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceSfmt86243, 0001, 1, 0

PSP2_IMPORT_FUNC SceSfmt86243, 0001, F00, 0x2ff42588, sceSfmt86243InitGenRand
PSP2_IMPORT_FUNC SceSfmt86243, 0001, F00, 0x569bf903, sceSfmt86243GenRand32
PSP2_IMPORT_FUNC SceSfmt86243, 0001, F00, 0x81b67ab5, sceSfmt86243InitByArray
PSP2_IMPORT_FUNC SceSfmt86243, 0001, F00, 0x8e25cba8, sceSfmt86243GenRand64
PSP2_IMPORT_FUNC SceSfmt86243, 0001, F00, 0xc297e6b1, sceSfmt86243FillArray32
PSP2_IMPORT_FUNC SceSfmt86243, 0001, F00, 0xf7ffe87c, sceSfmt86243FillArray64
