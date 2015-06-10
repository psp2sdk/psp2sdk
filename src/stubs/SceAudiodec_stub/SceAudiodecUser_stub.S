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
