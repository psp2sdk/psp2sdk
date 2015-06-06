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

PSP2_IMPORT_HEAD 0x0, SceAudiodec, 0001, 1, 0

PSP2_IMPORT_FUNC SceAudiodec, 0001, F00, 0x445c2cef, sceAudiodecInitLibrary
PSP2_IMPORT_FUNC SceAudiodec, 0001, F00, 0x45719b9d, sceAudiodecTermLibrary
PSP2_IMPORT_FUNC SceAudiodec, 0001, F00, 0x4dfd3aaa, sceAudiodecCreateDecoder
PSP2_IMPORT_FUNC SceAudiodec, 0001, F00, 0x56085dfb, sceAudiodecCreateDecoderExternal
PSP2_IMPORT_FUNC SceAudiodec, 0001, F00, 0x68f4a9cb, sceAudiodecDecodeNStreams
PSP2_IMPORT_FUNC SceAudiodec, 0001, F00, 0x8018aa9b, sceAudiodecDecodeNFrames
PSP2_IMPORT_FUNC SceAudiodec, 0001, F00, 0x883b0cf5, sceAudiodecGetInternalError
PSP2_IMPORT_FUNC SceAudiodec, 0001, F00, 0xccdaba04, sceAudiodecDecode
PSP2_IMPORT_FUNC SceAudiodec, 0001, F00, 0xdb712abc, sceAudiodecGetContextSize
PSP2_IMPORT_FUNC SceAudiodec, 0001, F00, 0xe4ea05bb, sceAudiodecDeleteDecoderExternal
PSP2_IMPORT_FUNC SceAudiodec, 0001, F00, 0xe7a24e16, sceAudiodecDeleteDecoder
PSP2_IMPORT_FUNC SceAudiodec, 0001, F00, 0xf72f9b64, sceAudiodecClearContext
