@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceNpTus, 0001, 1, 0

PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0x0374c127, sceNpTusGetMultiUserVariableVUser
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0x0a5d05f1, sceNpTusAddAndGetVariableAsync
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0x0cfac523, sceNpTusDeleteMultiSlotDataAsync
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0x1989cc51, sceNpTusSetDataVUserAsync
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0x1c8d73a8, sceNpTssGetDataAsync
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0x246db508, sceNpTusDeleteMultiSlotVariable
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0x2c5f1162, sceNpTusAbortRequest
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0x2e9a7fd0, sceNpTusSetMultiSlotVariableVUserAsync
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0x33e29819, sceNpTusSetData
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0x3907a8bc, sceNpTusWaitAsync
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0x3b44d0e4, sceNpTusDeleteMultiSlotVariableVUserAsync
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0x4099fc56, sceNpTusAddAndGetVariable
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0x41fbed79, sceNpTusDeleteMultiSlotDataVUser
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0x420350f9, sceNpTusDeleteMultiSlotVariableVUser
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0x44947d07, sceNpTusTryAndSetVariableAsync
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0x50fc680f, sceNpTusGetMultiSlotDataStatusVUser
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0x518a64b9, sceNpTusTryAndSetVariableVUserAsync
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0x520975c3, sceNpTusGetMultiSlotDataStatusAsync
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0x5eb05c7a, sceNpTusGetMultiSlotVariable
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0x6a175f75, sceNpTusSetDataVUser
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0x6b2a54eb, sceNpTusTryAndSetVariableVUser
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0x7593d595, sceNpTusGetMultiUserDataStatusVUserAsync
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0x7a101394, sceNpTssGetDataNoLimitAsync
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0x7edc33b3, sceNpTusTerm
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0x883ac44a, sceNpTusGetDataAsync
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0x88a2d551, sceNpTusChangeModeForOtherSaveDataOwners
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0x8972df8f, sceNpTssGetStorageAsync
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0x8ca469f4, sceNpTssGetSmallStorage
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0x9677bdd6, sceNpTusGetData
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0x987d1018, sceNpTssGetDataNoLimit
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0x99dc7420, sceNpTusCreateRequest
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0x9a1e4472, sceNpTusSetMultiSlotVariableVUser
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0x9ba9148c, sceNpTusDeleteMultiSlotDataVUserAsync
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0x9e8e1cf8, sceNpTusGetDataVUserAsync
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0x9faba1e5, sceNpTusSetDataAsync
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0xa3f00ee6, sceNpTusSetMultiSlotVariable
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0xa61aedb0, sceNpTusSetMultiSlotVariableAsync
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0xaf7148a6, sceNpTusGetMultiUserDataStatusVUser
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0xb0a6f839, sceNpTusTryAndSetVariable
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0xb2141f8d, sceNpTusInit
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0xb46b5d7f, sceNpTusDeleteRequest
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0xbb5e5e29, sceNpTusAddAndGetVariableVUserAsync
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0xbbefcd26, sceNpTusGetMultiUserVariableAsync
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0xc003c588, sceNpTusPollAsync
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0xc08a1e5e, sceNpTusGetMultiUserDataStatusAsync
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0xc4bb64a7, sceNpTusSetTimeout
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0xc5656132, sceNpTusGetMultiUserVariable
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0xccb9e791, sceNpTusGetDataVUser
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0xd26b9f4c, sceNpTusGetMultiSlotVariableAsync
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0xd51b39ed, sceNpTusGetMultiUserVariableVUserAsync
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0xd53d3692, sceNpTusDeleteTitleCtx
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0xd62d2a0b, sceNpTusGetMultiSlotDataStatusVUserAsync
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0xd8d5caba, sceNpTssGetData
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0xd97e51ec, sceNpTusGetMultiSlotDataStatus
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0xe1d6d4cf, sceNpTusAddAndGetVariableVUser
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0xea588f23, sceNpTssGetSmallStorageAsync
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0xf1d9529e, sceNpTusCreateTitleCtx
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0xf4d40b19, sceNpTusGetMultiUserDataStatus
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0xf6d24df7, sceNpTusDeleteMultiSlotData
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0xf91887ec, sceNpTusGetMultiSlotVariableVUserAsync
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0xfc0c5159, sceNpTusDeleteMultiSlotVariableAsync
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0xfc300e7e, sceNpTssGetStorage
PSP2_IMPORT_FUNC SceNpTus, 0001, F00, 0xfe92d6cb, sceNpTusGetMultiSlotVariableVUser
