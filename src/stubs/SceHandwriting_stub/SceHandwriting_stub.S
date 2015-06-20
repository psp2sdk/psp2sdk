@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceHandwriting, 0001, 1, 0

PSP2_IMPORT_FUNC SceHandwriting, 0001, F00, 0x09af9bf8, sceHandwritingSetMode
PSP2_IMPORT_FUNC SceHandwriting, 0001, F00, 0x12e4f99a, sceHandwritingRecognize
PSP2_IMPORT_FUNC SceHandwriting, 0001, F00, 0x356b2931, sceHandwritingTerm
PSP2_IMPORT_FUNC SceHandwriting, 0001, F00, 0x446f171e, sceHandwritingInit
PSP2_IMPORT_FUNC SceHandwriting, 0001, F00, 0x4c3a8d49, sceHandwritingGetBufferSize
PSP2_IMPORT_FUNC SceHandwriting, 0001, F00, 0x69324689, sceHandwritingRegisterInfo
PSP2_IMPORT_FUNC SceHandwriting, 0001, F00, 0x6abbd675, sceHandwritingRegisterTerm
PSP2_IMPORT_FUNC SceHandwriting, 0001, F00, 0x6ba4a521, sceHandwritingRegisterDelete
PSP2_IMPORT_FUNC SceHandwriting, 0001, F00, 0x76395d93, sceHandwritingRegisterInit
PSP2_IMPORT_FUNC SceHandwriting, 0001, F00, 0x79ca5d3f, sceHandwritingRegisterSet
PSP2_IMPORT_FUNC SceHandwriting, 0001, F00, 0xb886450e, sceHandwritingRegisterGetResult
