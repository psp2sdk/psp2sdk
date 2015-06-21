@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceAudioIn, 0001, 1, 0

PSP2_IMPORT_FUNC SceAudioIn, 0001, F00, 0x2f940377, sceAudioInGetStatus
PSP2_IMPORT_FUNC SceAudioIn, 0001, F00, 0x39b50dc1, sceAudioInOpenPort
PSP2_IMPORT_FUNC SceAudioIn, 0001, F00, 0x3a61b8c4, sceAudioInReleasePort
PSP2_IMPORT_FUNC SceAudioIn, 0001, F00, 0x566ac433, sceAudioInGetAdopt
PSP2_IMPORT_FUNC SceAudioIn, 0001, F00, 0x638add2d, sceAudioInInput
