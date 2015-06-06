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

PSP2_IMPORT_HEAD 0x0, sceAppUtil, 0001, 1, 0

PSP2_IMPORT_FUNC sceAppUtil, 0001, F00, 0x0f4ee55f, sceAppUtilAppEventParseLiveArea
PSP2_IMPORT_FUNC sceAppUtil, 0001, F00, 0x22297d59, sceAppUtilAppEventParseIncomingDialog
PSP2_IMPORT_FUNC sceAppUtil, 0001, F00, 0x266a7646, sceAppUtilSaveDataSlotDelete
PSP2_IMPORT_FUNC sceAppUtil, 0001, F00, 0x28c7d4f6, sceAppUtilAppEventParseNpBasicJoinablePresence
PSP2_IMPORT_FUNC sceAppUtil, 0001, F00, 0x2db7be3b, sceAppUtilDrmOpen
PSP2_IMPORT_FUNC sceAppUtil, 0001, F00, 0x3424d772, sceAppUtilLoadSafeMemory
PSP2_IMPORT_FUNC sceAppUtil, 0001, F00, 0x5dfb9ca0, sceAppUtilSystemParamGetInt
PSP2_IMPORT_FUNC sceAppUtil, 0001, F00, 0x607647ba, sceAppUtilSaveDataDataSave
PSP2_IMPORT_FUNC sceAppUtil, 0001, F00, 0x6a140498, sceAppUtilDrmClose
PSP2_IMPORT_FUNC sceAppUtil, 0001, F00, 0x6bed9b58, sceAppUtilAppEventParseNpAppDataMessage
PSP2_IMPORT_FUNC sceAppUtil, 0001, F00, 0x6e6aa267, sceAppUtilSystemParamGetString
PSP2_IMPORT_FUNC sceAppUtil, 0001, F00, 0x77380601, sceAppUtilAppEventParseNearGift
PSP2_IMPORT_FUNC sceAppUtil, 0001, F00, 0x7e8fe96a, sceAppUtilSaveDataSlotCreate
PSP2_IMPORT_FUNC sceAppUtil, 0001, F00, 0x85fa94ee, sceAppUtilStoreBrowse
PSP2_IMPORT_FUNC sceAppUtil, 0001, F00, 0x8dee696b, sceAppUtilAppEventParseTriggerUtil
PSP2_IMPORT_FUNC sceAppUtil, 0001, F00, 0x8ed716f5, sceAppUtilAppEventParseWebBrowser
PSP2_IMPORT_FUNC sceAppUtil, 0001, F00, 0x93f0d89f, sceAppUtilSaveDataSlotGetParam
PSP2_IMPORT_FUNC sceAppUtil, 0001, F00, 0x9651b941, sceAppUtilPhotoUmount
PSP2_IMPORT_FUNC sceAppUtil, 0001, F00, 0x96f478d6, sceAppUtilBgdlGetStatus
PSP2_IMPORT_FUNC sceAppUtil, 0001, F00, 0x98630136, sceAppUtilSaveDataSlotSetParam
PSP2_IMPORT_FUNC sceAppUtil, 0001, F00, 0x9d8ac677, sceAppUtilSaveSafeMemory
PSP2_IMPORT_FUNC sceAppUtil, 0001, F00, 0xa2496814, sceAppUtilAppEventParseNpInviteMessage
PSP2_IMPORT_FUNC sceAppUtil, 0001, F00, 0xb220b00b, sceAppUtilShutdown
PSP2_IMPORT_FUNC sceAppUtil, 0001, F00, 0xc560e716, sceAppUtilSaveDataGetQuota
PSP2_IMPORT_FUNC sceAppUtil, 0001, F00, 0xcd7fd67a, sceAppUtilAppParamGetInt
PSP2_IMPORT_FUNC sceAppUtil, 0001, F00, 0xd1c6ab8e, sceAppUtilSaveDataDataRemove
PSP2_IMPORT_FUNC sceAppUtil, 0001, F00, 0xdaffe671, sceAppUtilInit
PSP2_IMPORT_FUNC sceAppUtil, 0001, F00, 0xe6057a85, sceAppUtilSaveDataSlotSearch
PSP2_IMPORT_FUNC sceAppUtil, 0001, F00, 0xee0dbed9, sceAppUtilReceiveAppEvent
PSP2_IMPORT_FUNC sceAppUtil, 0001, F00, 0xee85804d, sceAppUtilPhotoMount
PSP2_IMPORT_FUNC sceAppUtil, 0001, F00, 0xf19d0423, sceAppUtilLaunchWebBrowser
