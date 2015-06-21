@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceScreenShot, 0001, 1, 0

PSP2_IMPORT_FUNC SceScreenShot, 0001, F00, 0x05db59c7, sceScreenShotSetParam
PSP2_IMPORT_FUNC SceScreenShot, 0001, F00, 0x50ae9ff9, sceScreenShotDisable
PSP2_IMPORT_FUNC SceScreenShot, 0001, F00, 0x7061665b, sceScreenShotSetOverlayImage
PSP2_IMPORT_FUNC SceScreenShot, 0001, F00, 0x76e674d1, sceScreenShotEnable
PSP2_IMPORT_FUNC SceScreenShot, 0001, F00, 0x816633fe, sceScreenShotEnableNotification
PSP2_IMPORT_FUNC SceScreenShot, 0001, F00, 0xbae9e534, sceScreenShotGetParam
PSP2_IMPORT_FUNC SceScreenShot, 0001, F00, 0xd509fb08, sceScreenShotCapture
PSP2_IMPORT_FUNC SceScreenShot, 0001, F00, 0xda80a228, sceScreenShotDisableNotification
