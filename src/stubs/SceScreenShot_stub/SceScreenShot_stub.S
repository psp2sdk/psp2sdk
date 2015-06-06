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

PSP2_IMPORT_HEAD 0x0, SceScreenShot, 0001, 1, 0

PSP2_IMPORT_FUNC SceScreenShot, 0001, F00, 0x05db59c7, sceScreenShotSetParam
PSP2_IMPORT_FUNC SceScreenShot, 0001, F00, 0x50ae9ff9, sceScreenShotDisable
PSP2_IMPORT_FUNC SceScreenShot, 0001, F00, 0x7061665b, sceScreenShotSetOverlayImage
PSP2_IMPORT_FUNC SceScreenShot, 0001, F00, 0x76e674d1, sceScreenShotEnable
PSP2_IMPORT_FUNC SceScreenShot, 0001, F00, 0x816633fe, sceScreenShotEnableNotification
PSP2_IMPORT_FUNC SceScreenShot, 0001, F00, 0xbae9e534, sceScreenShotGetParam
PSP2_IMPORT_FUNC SceScreenShot, 0001, F00, 0xd509fb08, sceScreenShotCapture
PSP2_IMPORT_FUNC SceScreenShot, 0001, F00, 0xda80a228, sceScreenShotDisableNotification
