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

PSP2_IMPORT_HEAD 0x0, SceCtrl, 0001, 1, 0

PSP2_IMPORT_FUNC SceCtrl, 0001, F00, 0x104ed1a7, sceCtrlPeekBufferNegative
PSP2_IMPORT_FUNC SceCtrl, 0001, F00, 0x15f96fb0, sceCtrlReadBufferNegative
PSP2_IMPORT_FUNC SceCtrl, 0001, F00, 0x67e7ab83, sceCtrlReadBufferPositive
PSP2_IMPORT_FUNC SceCtrl, 0001, F00, 0xa497b150, sceCtrlSetSamplingMode
PSP2_IMPORT_FUNC SceCtrl, 0001, F00, 0xa9c3ced6, sceCtrlPeekBufferPositive
PSP2_IMPORT_FUNC SceCtrl, 0001, F00, 0xd8294c9c, sceCtrlClearRapidFire
PSP2_IMPORT_FUNC SceCtrl, 0001, F00, 0xe9cb69c8, sceCtrlSetRapidFire
PSP2_IMPORT_FUNC SceCtrl, 0001, F00, 0xec752aaf, sceCtrlGetSamplingMode
