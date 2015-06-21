@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceSha256, 0001, 1, 0

PSP2_IMPORT_FUNC SceSha256, 0001, F00, 0x9b5bb4ba, sceSha256BlockResult
PSP2_IMPORT_FUNC SceSha256, 0001, F00, 0xa337079c, sceSha256Digest
PSP2_IMPORT_FUNC SceSha256, 0001, F00, 0xdaeca1f8, sceSha256BlockUpdate
PSP2_IMPORT_FUNC SceSha256, 0001, F00, 0xe281374f, sceSha256BlockInit
