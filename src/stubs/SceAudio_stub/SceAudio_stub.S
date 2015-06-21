@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceAudio, 0001, 1, 0

PSP2_IMPORT_FUNC SceAudio, 0001, F00, 0x02db3f5f, sceAudioOutOutput
PSP2_IMPORT_FUNC SceAudio, 0001, F00, 0x12fb1767, sceAudioOutGetAdopt
PSP2_IMPORT_FUNC SceAudio, 0001, F00, 0x5bc341e4, sceAudioOutOpenPort
PSP2_IMPORT_FUNC SceAudio, 0001, F00, 0x64167f11, sceAudioOutSetVolume
PSP2_IMPORT_FUNC SceAudio, 0001, F00, 0x69e2e6b5, sceAudioOutReleasePort
PSP2_IMPORT_FUNC SceAudio, 0001, F00, 0x940ce469, sceAudioOutSetAlcMode
PSP2_IMPORT_FUNC SceAudio, 0001, F00, 0x9a5370c4, sceAudioOutGetRestSample
PSP2_IMPORT_FUNC SceAudio, 0001, F00, 0x9c8edaea, sceAudioOutGetConfig
PSP2_IMPORT_FUNC SceAudio, 0001, F00, 0xb8ba0d07, sceAudioOutSetConfig
