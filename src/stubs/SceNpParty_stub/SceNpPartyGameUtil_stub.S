@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceNpPartyGameUtil, 0001, 1, 0

PSP2_IMPORT_FUNC SceNpPartyGameUtil, 0001, F00, 0x0560d9a1, sceNpPartyGetMemberInfo
PSP2_IMPORT_FUNC SceNpPartyGameUtil, 0001, F00, 0x324c76f0, sceNpPartyRegisterHandler
PSP2_IMPORT_FUNC SceNpPartyGameUtil, 0001, F00, 0x420c30e9, sceNpPartyGetMembers
PSP2_IMPORT_FUNC SceNpPartyGameUtil, 0001, F00, 0x9f99adf7, sceNpPartyGetState
PSP2_IMPORT_FUNC SceNpPartyGameUtil, 0001, F00, 0xb304962c, sceNpPartyInit
PSP2_IMPORT_FUNC SceNpPartyGameUtil, 0001, F00, 0xb6132502, sceNpPartyCheckCallback
PSP2_IMPORT_FUNC SceNpPartyGameUtil, 0001, F00, 0xf524ad2b, sceNpPartyTerm
PSP2_IMPORT_FUNC SceNpPartyGameUtil, 0001, F00, 0xfb200a6d, sceNpPartyGetMemberVoiceInfo
