@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceDTrace, 0001, 1, 0

PSP2_IMPORT_FUNC SceDTrace, 0001, F00, 0x413c420e, sceDTraceHelperIoctl
PSP2_IMPORT_FUNC SceDTrace, 0001, F00, 0x63f0c4f5, sceDTraceClientIoctl
PSP2_IMPORT_FUNC SceDTrace, 0001, F00, 0x761062e9, sceDTraceClientOpen
PSP2_IMPORT_FUNC SceDTrace, 0001, F00, 0xa47807d7, sceDTraceAddHelperDof
PSP2_IMPORT_FUNC SceDTrace, 0001, F00, 0xb8232491, sceDTraceClientClose
PSP2_IMPORT_FUNC SceDTrace, 0001, F00, 0xf2c9207a, sceDTraceRemoveHelperDof
