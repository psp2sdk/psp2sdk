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

PSP2_IMPORT_HEAD 0x0, ScePgf, 0001, 1, 0

PSP2_IMPORT_FUNC ScePgf, 0001, F00, 0x03f10ec8, sceFontPointToPixelV
PSP2_IMPORT_FUNC ScePgf, 0001, F00, 0x07ee1733, sceFontDoneLib
PSP2_IMPORT_FUNC ScePgf, 0001, F00, 0x1055aba3, sceFontNewLib
PSP2_IMPORT_FUNC ScePgf, 0001, F00, 0x39b9aeff, sceFontPointToPixelH
PSP2_IMPORT_FUNC ScePgf, 0001, F00, 0x4a7293e9, sceFontClose
PSP2_IMPORT_FUNC ScePgf, 0001, F00, 0x51061d87, sceFontFindFont
PSP2_IMPORT_FUNC ScePgf, 0001, F00, 0x6fd1ba65, sceFontGetCharInfo
PSP2_IMPORT_FUNC ScePgf, 0001, F00, 0x70c86b3e, sceFontGetCharImageRect
PSP2_IMPORT_FUNC ScePgf, 0001, F00, 0x7b45e2d1, sceFontPixelToPointV
PSP2_IMPORT_FUNC ScePgf, 0001, F00, 0x7d8cb13b, sceFontFlush
PSP2_IMPORT_FUNC ScePgf, 0001, F00, 0x8d5b44df, sceFontSetAltCharacterCode
PSP2_IMPORT_FUNC ScePgf, 0001, F00, 0x8dfbae1b, sceFontFindOptimumFont
PSP2_IMPORT_FUNC ScePgf, 0001, F00, 0x9e38f4d6, sceFontPixelToPointH
PSP2_IMPORT_FUNC ScePgf, 0001, F00, 0x9f842307, sceFontGetNumFontList
PSP2_IMPORT_FUNC ScePgf, 0001, F00, 0xab034738, sceFontGetFontInfoByIndexNumber
PSP2_IMPORT_FUNC ScePgf, 0001, F00, 0xab45aad3, sceFontGetCharGlyphImage
PSP2_IMPORT_FUNC ScePgf, 0001, F00, 0xb23ed47c, sceFontOpenUserMemory
PSP2_IMPORT_FUNC ScePgf, 0001, F00, 0xbd2dfcff, sceFontOpen
PSP2_IMPORT_FUNC ScePgf, 0001, F00, 0xd56dccea, sceFontGetFontList
PSP2_IMPORT_FUNC ScePgf, 0001, F00, 0xde47674c, sceFontSetResolution
PSP2_IMPORT_FUNC ScePgf, 0001, F00, 0xe260e740, sceFontOpenUserFile
PSP2_IMPORT_FUNC ScePgf, 0001, F00, 0xeb589530, sceFontGetCharGlyphImage_Clip
PSP2_IMPORT_FUNC ScePgf, 0001, F00, 0xf9414fa2, sceFontGetFontInfo
