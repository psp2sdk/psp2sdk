@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceJpegEncUser, 0001, 1, 0

PSP2_IMPORT_FUNC SceJpegEncUser, 0001, F00, 0x25d52d97, sceJpegEncoderSetOutputAddr
PSP2_IMPORT_FUNC SceJpegEncUser, 0001, F00, 0x2b55844d, sceJpegEncoderGetContextSize
PSP2_IMPORT_FUNC SceJpegEncUser, 0001, F00, 0x2e8fe45d, sceJpegEncoderInitWithParam
PSP2_IMPORT_FUNC SceJpegEncUser, 0001, F00, 0x2f58b12c, sceJpegEncoderSetHeaderMode
PSP2_IMPORT_FUNC SceJpegEncUser, 0001, F00, 0x824a7d4f, sceJpegEncoderCsc
PSP2_IMPORT_FUNC SceJpegEncUser, 0001, F00, 0x88da92b4, sceJpegEncoderInit
PSP2_IMPORT_FUNC SceJpegEncUser, 0001, F00, 0x9511f3bc, sceJpegEncoderSetValidRegion
PSP2_IMPORT_FUNC SceJpegEncUser, 0001, F00, 0xb2b828ec, sceJpegEncoderSetCompressionRatio
PSP2_IMPORT_FUNC SceJpegEncUser, 0001, F00, 0xc60de94c, sceJpegEncoderEncode
PSP2_IMPORT_FUNC SceJpegEncUser, 0001, F00, 0xc87aa849, sceJpegEncoderEnd
