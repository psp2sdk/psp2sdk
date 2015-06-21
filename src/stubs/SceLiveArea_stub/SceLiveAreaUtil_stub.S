@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceLiveAreaUtil, 0001, 1, 0

PSP2_IMPORT_FUNC SceLiveAreaUtil, 0001, F00, 0x18066ba9, sceLiveAreaReplaceAllAsync
PSP2_IMPORT_FUNC SceLiveAreaUtil, 0001, F00, 0x29c65c0b, sceLiveAreaReplaceAllSync
PSP2_IMPORT_FUNC SceLiveAreaUtil, 0001, F00, 0x7fe5b83f, sceLiveAreaGetStatus
PSP2_IMPORT_FUNC SceLiveAreaUtil, 0001, F00, 0x833f5d0a, sceLiveAreaGetRevision
PSP2_IMPORT_FUNC SceLiveAreaUtil, 0001, F00, 0xcfcede95, sceLiveAreaUpdateFrameSync
PSP2_IMPORT_FUNC SceLiveAreaUtil, 0001, F00, 0xd330285d, sceLiveAreaUpdateFrameAsync
PSP2_IMPORT_FUNC SceLiveAreaUtil, 0001, F00, 0xd6ee2214, sceLiveAreaGetFrameRevision
PSP2_IMPORT_FUNC SceLiveAreaUtil, 0001, F00, 0xd6fd367f, sceLiveAreaGetFrameUserData
