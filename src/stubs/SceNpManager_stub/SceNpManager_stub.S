@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceNpManager, 0001, 1, 0

PSP2_IMPORT_FUNC SceNpManager, 0001, F00, 0x04d9f484, sceNpInit
PSP2_IMPORT_FUNC SceNpManager, 0001, F00, 0x19e40ae1, sceNpTerm
PSP2_IMPORT_FUNC SceNpManager, 0001, F00, 0x3b0ae9a9, sceNpCheckCallback
PSP2_IMPORT_FUNC SceNpManager, 0001, F00, 0x3c94b4b4, sceNpManagerGetNpId
PSP2_IMPORT_FUNC SceNpManager, 0001, F00, 0x43dc48a1, sceNpManagerGetCachedParam
PSP2_IMPORT_FUNC SceNpManager, 0001, F00, 0x44239c35, sceNpRegisterServiceStateCallback
PSP2_IMPORT_FUNC SceNpManager, 0001, F00, 0x54060df6, sceNpGetServiceState
PSP2_IMPORT_FUNC SceNpManager, 0001, F00, 0x60c575b1, sceNpManagerGetChatRestrictionFlag
PSP2_IMPORT_FUNC SceNpManager, 0001, F00, 0xaf0073b2, sceNpManagerGetContentRatingFlag
PSP2_IMPORT_FUNC SceNpManager, 0001, F00, 0xd9e6e56c, sceNpUnregisterServiceStateCallback
PSP2_IMPORT_FUNC SceNpManager, 0001, F00, 0xfe835967, sceNpManagerGetAccountRegion
