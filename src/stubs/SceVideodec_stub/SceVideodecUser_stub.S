@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceVideodecUser, 0001, 1, 0

PSP2_IMPORT_FUNC SceVideodecUser, 0001, F00, 0x0eb2e4e7, sceM4vdecDeleteDecoder
PSP2_IMPORT_FUNC SceVideodecUser, 0001, F00, 0x17c6ac9e, sceM4vdecCreateDecoder
PSP2_IMPORT_FUNC SceVideodecUser, 0001, F00, 0x230a78ff, sceVideodecInitLibraryWithUnmapMem
PSP2_IMPORT_FUNC SceVideodecUser, 0001, F00, 0x25f31020, sceAvcdecDecodeFlush
PSP2_IMPORT_FUNC SceVideodecUser, 0001, F00, 0x3a5f4924, sceVideodecTermLibrary
PSP2_IMPORT_FUNC SceVideodecUser, 0001, F00, 0x441673e3, sceAvcdecDecodeAvailableSize
PSP2_IMPORT_FUNC SceVideodecUser, 0001, F00, 0x624664db, sceM4vdecDecode
PSP2_IMPORT_FUNC SceVideodecUser, 0001, F00, 0x6731bb2d, sceVideodecQueryMemSize
PSP2_IMPORT_FUNC SceVideodecUser, 0001, F00, 0x7c460d75, sceM4vdecDecodeFlush
PSP2_IMPORT_FUNC SceVideodecUser, 0001, F00, 0x87cfd23b, sceM4vdecDecodeStop
PSP2_IMPORT_FUNC SceVideodecUser, 0001, F00, 0x8a0e359e, sceAvcdecDeleteDecoder
PSP2_IMPORT_FUNC SceVideodecUser, 0001, F00, 0x9648d853, sceAvcdecDecodeStop
PSP2_IMPORT_FUNC SceVideodecUser, 0001, F00, 0x97e95edb, sceAvcdecQueryDecoderMemSize
PSP2_IMPORT_FUNC SceVideodecUser, 0001, F00, 0xa8cf1942, sceM4vdecDecodeAvailableSize
PSP2_IMPORT_FUNC SceVideodecUser, 0001, F00, 0xb2a428db, sceAvcdecCsc
PSP2_IMPORT_FUNC SceVideodecUser, 0001, F00, 0xb4bc325b, sceM4vdecCsc
PSP2_IMPORT_FUNC SceVideodecUser, 0001, F00, 0xc300bf46, sceAvcdecCscInternal
PSP2_IMPORT_FUNC SceVideodecUser, 0001, F00, 0xc67c1a80, sceM4vdecQueryDecoderMemSize
PSP2_IMPORT_FUNC SceVideodecUser, 0001, F00, 0xd6190a06, sceAvcdecDecode
PSP2_IMPORT_FUNC SceVideodecUser, 0001, F00, 0xe82bb69b, sceAvcdecCreateDecoder
PSP2_IMPORT_FUNC SceVideodecUser, 0001, F00, 0xf1af65a3, sceVideodecInitLibrary
