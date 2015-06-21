@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceSha512t, 0001, 1, 0

PSP2_IMPORT_FUNC SceSha512t, 0001, F00, 0x00e52720, sceSha512tDigest
PSP2_IMPORT_FUNC SceSha512t, 0001, F00, 0x66425db6, sceSha512tBlockResult
PSP2_IMPORT_FUNC SceSha512t, 0001, F00, 0x79065bb2, sceSha512tBlockInit
PSP2_IMPORT_FUNC SceSha512t, 0001, F00, 0xc5359df8, sceSha512tBlockUpdate
