@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceSha384, 0001, 1, 0

PSP2_IMPORT_FUNC SceSha384, 0001, F00, 0x037aabe7, sceSha384BlockInit
PSP2_IMPORT_FUNC SceSha384, 0001, F00, 0x30d5c919, sceSha384BlockResult
PSP2_IMPORT_FUNC SceSha384, 0001, F00, 0x4b99dbb8, sceSha384BlockUpdate
PSP2_IMPORT_FUNC SceSha384, 0001, F00, 0xa602c694, sceSha384Digest
