@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceProcessmgr, 0001, 1, 0

PSP2_IMPORT_FUNC SceProcessmgr, 0001, F00, 0x0039be45, sceKernelLibcTime
PSP2_IMPORT_FUNC SceProcessmgr, 0001, F00, 0x2252890c, sceKernelPowerTick
PSP2_IMPORT_FUNC SceProcessmgr, 0001, F00, 0x4b879059, sceKernelLibcGettimeofday
PSP2_IMPORT_FUNC SceProcessmgr, 0001, F00, 0x890bdc39, sceKernelLibcMktime
PSP2_IMPORT_FUNC SceProcessmgr, 0001, F00, 0x94f041ed, sceKernelLibcLocaltime_r
PSP2_IMPORT_FUNC SceProcessmgr, 0001, F00, 0x9e45da09, sceKernelLibcClock
PSP2_IMPORT_FUNC SceProcessmgr, 0001, F00, 0xbca437cd, sceKernelLibcGmtime_r
PSP2_IMPORT_FUNC SceProcessmgr, 0001, F00, 0xc1727f59, sceKernelGetStdin
PSP2_IMPORT_FUNC SceProcessmgr, 0001, F00, 0xe5aa625c, sceKernelGetStdout
PSP2_IMPORT_FUNC SceProcessmgr, 0001, F00, 0xfa5e3ada, sceKernelGetStderr
