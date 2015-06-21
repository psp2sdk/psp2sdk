@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceAvPlayer, 0001, 1, 0

PSP2_IMPORT_FUNC SceAvPlayer, 0001, F00, 0x11ff162d, sceAvPlayerResume
PSP2_IMPORT_FUNC SceAvPlayer, 0001, F00, 0x15365ece, sceAvPlayerDisableStream
PSP2_IMPORT_FUNC SceAvPlayer, 0001, F00, 0x22986cd1, sceAvPlayerGetVideoDataEx
PSP2_IMPORT_FUNC SceAvPlayer, 0001, F00, 0x2acb4217, sceAvPlayerStart
PSP2_IMPORT_FUNC SceAvPlayer, 0001, F00, 0x2cd86fd6, sceAvPlayerStreamCount
PSP2_IMPORT_FUNC SceAvPlayer, 0001, F00, 0x2e4ff35f, sceAvPlayerIsActive
PSP2_IMPORT_FUNC SceAvPlayer, 0001, F00, 0x34e2d370, sceAvPlayerGetStreamInfo
PSP2_IMPORT_FUNC SceAvPlayer, 0001, F00, 0x34fd744b, sceAvPlayerPause
PSP2_IMPORT_FUNC SceAvPlayer, 0001, F00, 0x3f51d38a, sceAvPlayerPostInit
PSP2_IMPORT_FUNC SceAvPlayer, 0001, F00, 0x4c847adf, sceAvPlayerInit
PSP2_IMPORT_FUNC SceAvPlayer, 0001, F00, 0x5b7db4bc, sceAvPlayerJumpToTime
PSP2_IMPORT_FUNC SceAvPlayer, 0001, F00, 0x70127ab8, sceAvPlayerEnableStream
PSP2_IMPORT_FUNC SceAvPlayer, 0001, F00, 0x7aa29b2d, sceAvPlayerClose
PSP2_IMPORT_FUNC SceAvPlayer, 0001, F00, 0x804dcecd, sceAvPlayerCurrentTime
PSP2_IMPORT_FUNC SceAvPlayer, 0001, F00, 0x86e0cf55, sceAvPlayerSetTrickSpeed
PSP2_IMPORT_FUNC SceAvPlayer, 0001, F00, 0x8bc3221b, sceAvPlayerGetVideoData
PSP2_IMPORT_FUNC SceAvPlayer, 0001, F00, 0xa10fc252, sceAvPlayerGetAudioData
PSP2_IMPORT_FUNC SceAvPlayer, 0001, F00, 0xbc83c8fd, sceAvPlayerAddSource
PSP2_IMPORT_FUNC SceAvPlayer, 0001, F00, 0xbd35e360, sceAvPlayerStop
PSP2_IMPORT_FUNC SceAvPlayer, 0001, F00, 0xec103adf, sceAvPlayerSetLooping
