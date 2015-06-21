@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceDbg, 0001, 1, 0

PSP2_IMPORT_FUNC SceDbg, 0001, F00, 0x1af3678b, sceDbgAssertionHandler
PSP2_IMPORT_FUNC SceDbg, 0001, F00, 0x3deaecd3, sceDbgSetBreakOnWarningState
PSP2_IMPORT_FUNC SceDbg, 0001, F00, 0x6605ab19, sceDbgLoggingHandler
PSP2_IMPORT_FUNC SceDbg, 0001, F00, 0x941622fa, sceDbgSetMinimumLogLevel
PSP2_IMPORT_FUNC SceDbg, 0001, F00, 0xed4a00ba, sceDbgSetBreakOnErrorState
