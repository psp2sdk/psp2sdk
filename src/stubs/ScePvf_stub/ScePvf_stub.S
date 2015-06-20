@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, ScePvf, 0001, 1, 0

PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0x10452b86, scePvfOpenUserFileWithSubfontIndex
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0x17a7873b, scePvfGetCharGlyphOutline
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0x2761feac, scePvfFindOptimumFont
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0x35465bd7, scePvfPointToPixelV
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0x37da496a, scePvfGetCharGlyphImage
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0x3dd09bc9, scePvfSetSkewValue
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0x58142d71, __scePvfSetFt2DoneLibCHook
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0x64e0ea8b, scePvfGetVertCharImageRect
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0x66f2d767, scePvfGetFontList
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0x687ff765, scePvfFlush
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0x6c1b9caf, scePvfGetCharImageRect
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0x6e787722, scePvfSetEmboldenRate
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0x72e58672, scePvfNewLib
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0x830625c2, scePvfSetAltCharacterCode
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0x8ae8433a, scePvfGetVertCharGlyphImage
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0x91f02f9a, scePvfPointToPixelH
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0x984e5bfe, scePvfFindFont
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0x997161c3, __scePvfSetFt2LibCHook
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0x9cbc1a46, scePvfOpenDefaultLatinFontOnSharedMemory
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0x9e65e4ed, scePvfOpenUserMemory
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0x9f018f25, scePvfIsElement
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0xa55f973f, scePvfGetCharGlyphImage_Clip
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0xa81570eb, scePvfOpenUserMemoryWithSubfontIndex
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0xa88eedb0, scePvfGetCharInfo
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0xab0c7cf2, scePvfGetFontInfo
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0xb6ce89e1, scePvfReleaseCharGlyphOutline
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0xb8d01915, scePvfGetVertCharInfo
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0xbc90f661, scePvfGetKerningInfo
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0xc4444fb3, scePvfSetResolution
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0xcda282d2, scePvfPixelToPointV
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0xd282c23c, scePvfClose
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0xd535520f, scePvfOpenUserFile
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0xdfb677c5, scePvfSetEM
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0xe17717ec, scePvfDoneLib
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0xe35434bb, scePvfOpen
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0xe676a888, scePvfIsVertElement
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0xeccb0cee, scePvfGetVertCharGlyphOutline
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0xeedab884, scePvfGetVertCharGlyphImage_Clip
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0xf17ade4d, scePvfSetCharSize
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0xf3e1e8bd, scePvfGetFontInfoByIndexNumber
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0xf56b5b9b, scePvfPixelToPointH
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0xf6c4a855, scePvfGetNumFontList
PSP2_IMPORT_FUNC ScePvf, 0001, F00, 0xfeee373a, scePvfOpenDefaultJapaneseFontOnSharedMemory
