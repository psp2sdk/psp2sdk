@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceAudioencUser, 0001, 1, 0

PSP2_IMPORT_FUNC SceAudioencUser, 0001, F00, 0x452246d0, sceAudioencGetInternalError
PSP2_IMPORT_FUNC SceAudioencUser, 0001, F00, 0x552e8882, sceAudioencDeleteEncoderExternal
PSP2_IMPORT_FUNC SceAudioencUser, 0001, F00, 0x64c04ae8, sceAudioencCreateEncoder
PSP2_IMPORT_FUNC SceAudioencUser, 0001, F00, 0x76ee4dc6, sceAudioencInitLibrary
PSP2_IMPORT_FUNC SceAudioencUser, 0001, F00, 0x9386f42d, sceAudioencClearContext
PSP2_IMPORT_FUNC SceAudioencUser, 0001, F00, 0x9b1e8de2, sceAudioencCreateEncoderExternal
PSP2_IMPORT_FUNC SceAudioencUser, 0001, F00, 0xab32d022, sceAudioencTermLibrary
PSP2_IMPORT_FUNC SceAudioencUser, 0001, F00, 0xc6ba5ee6, sceAudioencDeleteEncoder
PSP2_IMPORT_FUNC SceAudioencUser, 0001, F00, 0xd01c63a3, sceAudioencGetOptInfo
PSP2_IMPORT_FUNC SceAudioencUser, 0001, F00, 0xd85db29c, sceAudioencEncode
PSP2_IMPORT_FUNC SceAudioencUser, 0001, F00, 0xead4af38, sceAudioencGetContextSize
