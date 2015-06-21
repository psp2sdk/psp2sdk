@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceNetAdhocMatching, 0001, 1, 0

PSP2_IMPORT_FUNC SceNetAdhocMatching, 0001, F00, 0x04ff010c, sceNetAdhocMatchingCancelTarget
PSP2_IMPORT_FUNC SceNetAdhocMatching, 0001, F00, 0x54f6534d, sceNetAdhocMatchingCancelTargetWithOpt
PSP2_IMPORT_FUNC SceNetAdhocMatching, 0001, F00, 0x63abb632, sceNetAdhocMatchingStop
PSP2_IMPORT_FUNC SceNetAdhocMatching, 0001, F00, 0x659d4b04, sceNetAdhocMatchingSetHelloOpt
PSP2_IMPORT_FUNC SceNetAdhocMatching, 0001, F00, 0x6e195cd1, sceNetAdhocMatchingTerm
PSP2_IMPORT_FUNC SceNetAdhocMatching, 0001, F00, 0x7bad7ea2, sceNetAdhocMatchingCreate
PSP2_IMPORT_FUNC SceNetAdhocMatching, 0001, F00, 0x7bcdd889, sceNetAdhocMatchingDelete
PSP2_IMPORT_FUNC SceNetAdhocMatching, 0001, F00, 0x83c0e435, sceNetAdhocMatchingSendData
PSP2_IMPORT_FUNC SceNetAdhocMatching, 0001, F00, 0x85b23ceb, sceNetAdhocMatchingGetMembers
PSP2_IMPORT_FUNC SceNetAdhocMatching, 0001, F00, 0x8e0e0eae, sceNetAdhocMatchingInit
PSP2_IMPORT_FUNC SceNetAdhocMatching, 0001, F00, 0x90affedd, sceNetAdhocMatchingGetHelloOpt
PSP2_IMPORT_FUNC SceNetAdhocMatching, 0001, F00, 0x9a6b1d0f, sceNetAdhocMatchingSelectTarget
PSP2_IMPORT_FUNC SceNetAdhocMatching, 0001, F00, 0xf13e17be, sceNetAdhocMatchingStart
PSP2_IMPORT_FUNC SceNetAdhocMatching, 0001, F00, 0xfe77831e, sceNetAdhocMatchingAbortSendData
