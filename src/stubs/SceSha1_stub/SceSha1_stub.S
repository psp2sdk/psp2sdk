@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceSha1, 0001, 1, 0

PSP2_IMPORT_FUNC SceSha1, 0001, F00, 0x0195dadf, sceSha1BlockResult
PSP2_IMPORT_FUNC SceSha1, 0001, F00, 0x9007205e, sceSha1BlockUpdate
PSP2_IMPORT_FUNC SceSha1, 0001, F00, 0xb13d65aa, sceSha1BlockInit
PSP2_IMPORT_FUNC SceSha1, 0001, F00, 0xe1215c9d, sceSha1Digest
