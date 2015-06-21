@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceNpActivity, 0001, 1, 0

PSP2_IMPORT_FUNC SceNpActivity, 0001, F00, 0x9ea4901f, sceNpActivityTerm
PSP2_IMPORT_FUNC SceNpActivity, 0001, F00, 0xbc7fdc77, sceNpActivityPostStatus
PSP2_IMPORT_FUNC SceNpActivity, 0001, F00, 0xe0ffee97, sceNpActivityInit
