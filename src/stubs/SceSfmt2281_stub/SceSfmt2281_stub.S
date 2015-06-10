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

PSP2_IMPORT_HEAD 0x0, SceSfmt2281, 0001, 1, 0

PSP2_IMPORT_FUNC SceSfmt2281, 0001, F00, 0x17c10e2d, sceSfmt2281FillArray64
PSP2_IMPORT_FUNC SceSfmt2281, 0001, F00, 0x3cc47146, sceSfmt2281GenRand64
PSP2_IMPORT_FUNC SceSfmt2281, 0001, F00, 0x84bb4adb, sceSfmt2281GenRand32
PSP2_IMPORT_FUNC SceSfmt2281, 0001, F00, 0xab3ad459, sceSfmt2281InitByArray
PSP2_IMPORT_FUNC SceSfmt2281, 0001, F00, 0xb8e5a0bb, sceSfmt2281InitGenRand
PSP2_IMPORT_FUNC SceSfmt2281, 0001, F00, 0xbb89d8f0, sceSfmt2281FillArray32
