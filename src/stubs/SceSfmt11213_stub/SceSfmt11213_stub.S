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

PSP2_IMPORT_HEAD 0x0, SceSfmt11213, 0001, 1, 0

PSP2_IMPORT_FUNC SceSfmt11213, 0001, F00, 0x7a412a29, sceSfmt11213FillArray64
PSP2_IMPORT_FUNC SceSfmt11213, 0001, F00, 0x8ff464c9, sceSfmt11213InitGenRand
PSP2_IMPORT_FUNC SceSfmt11213, 0001, F00, 0xafedd6e1, sceSfmt11213GenRand64
PSP2_IMPORT_FUNC SceSfmt11213, 0001, F00, 0xbaf5f058, sceSfmt11213InitByArray
PSP2_IMPORT_FUNC SceSfmt11213, 0001, F00, 0xfb281cd7, sceSfmt11213GenRand32
PSP2_IMPORT_FUNC SceSfmt11213, 0001, F00, 0xfd696585, sceSfmt11213FillArray32
