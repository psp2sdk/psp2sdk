@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceNpSnsFacebook, 0001, 1, 0

PSP2_IMPORT_FUNC SceNpSnsFacebook, 0001, F00, 0x32fb2721, sceNpSnsFacebookAbortRequest
PSP2_IMPORT_FUNC SceNpSnsFacebook, 0001, F00, 0x80557aa0, sceNpSnsFacebookInit
PSP2_IMPORT_FUNC SceNpSnsFacebook, 0001, F00, 0x9a87eee9, sceNpSnsFacebookGetAccessToken
PSP2_IMPORT_FUNC SceNpSnsFacebook, 0001, F00, 0x9cf1bc76, sceNpSnsFacebookCreateRequest
PSP2_IMPORT_FUNC SceNpSnsFacebook, 0001, F00, 0xa3c9041d, sceNpSnsFacebookGetLongAccessToken
PSP2_IMPORT_FUNC SceNpSnsFacebook, 0001, F00, 0xa537ff90, sceNpSnsFacebookDeleteRequest
PSP2_IMPORT_FUNC SceNpSnsFacebook, 0001, F00, 0xa71e6847, sceNpSnsFacebookTerm
