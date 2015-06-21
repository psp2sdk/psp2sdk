@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceAppUtil, 0001, 1, 0

PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x0f4ee55f, sceAppUtilAppEventParseLiveArea
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x1b36af8c, sceAppUtilAddcontUmount
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x22297d59, sceAppUtilAppEventParseIncomingDialog
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x266a7646, sceAppUtilSaveDataSlotDelete
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x28c7d4f6, sceAppUtilAppEventParseNpBasicJoinablePresence
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x2af42d6a, sceAppUtilAppEventParseScreenShotNotification
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x2db7be3b, sceAppUtilDrmOpen
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x3424d772, sceAppUtilLoadSafeMemory
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x4faad133, sceAppUtilResetCookieWebBrowser
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x53b2c020, sceAppUtilAddcontMount
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x5dfb9ca0, sceAppUtilSystemParamGetInt
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x607647ba, sceAppUtilSaveDataDataSave
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x6a140498, sceAppUtilDrmClose
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x6bed9b58, sceAppUtilAppEventParseNpAppDataMessage
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x6e6aa267, sceAppUtilSystemParamGetString
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x7402c6ea, sceAppUtilPspSaveDataLoad
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x77380601, sceAppUtilAppEventParseNearGift
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x7e8fe96a, sceAppUtilSaveDataSlotCreate
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x85fa94ee, sceAppUtilStoreBrowse
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x8dee696b, sceAppUtilAppEventParseTriggerUtil
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x8ed716f5, sceAppUtilAppEventParseWebBrowser
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x93f0d89f, sceAppUtilSaveDataSlotGetParam
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x9651b941, sceAppUtilPhotoUmount
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x96f478d6, sceAppUtilBgdlGetStatus
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x98630136, sceAppUtilSaveDataSlotSetParam
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x9942071d, sceAppUtilPspSaveDataGetDirNameList
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x9d8ac677, sceAppUtilSaveSafeMemory
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0xa2496814, sceAppUtilAppEventParseNpInviteMessage
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0xa7fe1bf7, sceAppUtilMusicUmount
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0xb220b00b, sceAppUtilShutdown
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0xb5edcbff, sceAppUtilMusicMount
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0xc560e716, sceAppUtilSaveDataGetQuota
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0xc97d5d9e, sceAppUtilAddCookieWebBrowser
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0xcd7fd67a, sceAppUtilAppParamGetInt
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0xd1c6ab8e, sceAppUtilSaveDataDataRemove
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0xdaffe671, sceAppUtilInit
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0xe6057a85, sceAppUtilSaveDataSlotSearch
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0xe61453b0, sceAppUtilSaveDataMount
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0xeb720402, sceAppUtilSaveDataUmount
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0xee0dbed9, sceAppUtilReceiveAppEvent
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0xee85804d, sceAppUtilPhotoMount
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0xf19d0423, sceAppUtilLaunchWebBrowser
