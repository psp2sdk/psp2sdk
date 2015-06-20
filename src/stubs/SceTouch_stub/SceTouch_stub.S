@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceTouch, 0001, 1, 0

PSP2_IMPORT_FUNC SceTouch, 0001, F00, 0x10a2ca25, sceTouchGetPanelInfo
PSP2_IMPORT_FUNC SceTouch, 0001, F00, 0x169a1d58, sceTouchRead
PSP2_IMPORT_FUNC SceTouch, 0001, F00, 0x1b9c5d14, sceTouchSetSamplingState
PSP2_IMPORT_FUNC SceTouch, 0001, F00, 0x26531526, sceTouchGetSamplingState
PSP2_IMPORT_FUNC SceTouch, 0001, F00, 0x41194411, sceTouchDisableTouchForce
PSP2_IMPORT_FUNC SceTouch, 0001, F00, 0xb18370c2, sceTouchEnableTouchForce
PSP2_IMPORT_FUNC SceTouch, 0001, F00, 0xff082df0, sceTouchPeek
