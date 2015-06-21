@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceSha0, 0001, 1, 0

PSP2_IMPORT_FUNC SceSha0, 0001, F00, 0x37ef2afc, sceSha0BlockUpdate
PSP2_IMPORT_FUNC SceSha0, 0001, F00, 0xbcf6db3a, sceSha0BlockInit
PSP2_IMPORT_FUNC SceSha0, 0001, F00, 0xbf0158c4, sceSha0BlockResult
PSP2_IMPORT_FUNC SceSha0, 0001, F00, 0xd19a9aa8, sceSha0Digest
