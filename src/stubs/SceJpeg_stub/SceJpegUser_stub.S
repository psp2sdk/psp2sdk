@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceJpegUser, 0001, 1, 0

PSP2_IMPORT_FUNC SceJpegUser, 0001, F00, 0x123b4734, sceJpegCreateSplitDecoder
PSP2_IMPORT_FUNC SceJpegUser, 0001, F00, 0x2a769bd8, sceJpegDecodeMJpegYCbCr
PSP2_IMPORT_FUNC SceJpegUser, 0001, F00, 0x353ba9b0, sceJpegGetOutputInfo
PSP2_IMPORT_FUNC SceJpegUser, 0001, F00, 0x4598ec9c, sceJpegSplitDecodeMJpeg
PSP2_IMPORT_FUNC SceJpegUser, 0001, F00, 0x518163a7, sceJpegInitMJpegWithParam
PSP2_IMPORT_FUNC SceJpegUser, 0001, F00, 0x6215b095, sceJpegDecodeMJpeg
PSP2_IMPORT_FUNC SceJpegUser, 0001, F00, 0x6263aec2, sceJpegCsc
PSP2_IMPORT_FUNC SceJpegUser, 0001, F00, 0x62842598, sceJpegFinishMJpeg
PSP2_IMPORT_FUNC SceJpegUser, 0001, F00, 0xb030773b, sceJpegInitMJpeg
PSP2_IMPORT_FUNC SceJpegUser, 0001, F00, 0xc2380e3a, sceJpegMJpegCsc
PSP2_IMPORT_FUNC SceJpegUser, 0001, F00, 0xde8d5fa1, sceJpegDeleteSplitDecoder
