@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceAudiodecUser, 0001, 1, 0

PSP2_IMPORT_FUNC SceAudiodecUser, 0001, F00, 0x445c2cef, sceAudiodecInitLibrary
PSP2_IMPORT_FUNC SceAudiodecUser, 0001, F00, 0x45719b9d, sceAudiodecTermLibrary
PSP2_IMPORT_FUNC SceAudiodecUser, 0001, F00, 0x4dfd3aaa, sceAudiodecCreateDecoder
PSP2_IMPORT_FUNC SceAudiodecUser, 0001, F00, 0x56085dfb, sceAudiodecCreateDecoderExternal
PSP2_IMPORT_FUNC SceAudiodecUser, 0001, F00, 0x68f4a9cb, sceAudiodecDecodeNStreams
PSP2_IMPORT_FUNC SceAudiodecUser, 0001, F00, 0x8018aa9b, sceAudiodecDecodeNFrames
PSP2_IMPORT_FUNC SceAudiodecUser, 0001, F00, 0x883b0cf5, sceAudiodecGetInternalError
PSP2_IMPORT_FUNC SceAudiodecUser, 0001, F00, 0xccdaba04, sceAudiodecDecode
PSP2_IMPORT_FUNC SceAudiodecUser, 0001, F00, 0xdb712abc, sceAudiodecGetContextSize
PSP2_IMPORT_FUNC SceAudiodecUser, 0001, F00, 0xe4ea05bb, sceAudiodecDeleteDecoderExternal
PSP2_IMPORT_FUNC SceAudiodecUser, 0001, F00, 0xe7a24e16, sceAudiodecDeleteDecoder
PSP2_IMPORT_FUNC SceAudiodecUser, 0001, F00, 0xf72f9b64, sceAudiodecClearContext
