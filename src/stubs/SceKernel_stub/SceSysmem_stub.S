@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceSysmem, 0001, 1, 0

PSP2_IMPORT_FUNC SceSysmem, 0001, F00, 0x006f3db4, sceKernelGetMemBlockInfoByRange
PSP2_IMPORT_FUNC SceSysmem, 0001, F00, 0x4010ad65, sceKernelGetMemBlockInfoByAddr
PSP2_IMPORT_FUNC SceSysmem, 0001, F00, 0x87cc580b, sceKernelGetFreeMemorySize
PSP2_IMPORT_FUNC SceSysmem, 0001, F00, 0xa33b99d1, sceKernelFindMemBlockByAddr
PSP2_IMPORT_FUNC SceSysmem, 0001, F00, 0xa91e15ee, sceKernelFreeMemBlock
PSP2_IMPORT_FUNC SceSysmem, 0001, F00, 0xb8ef5818, sceKernelGetMemBlockBase
PSP2_IMPORT_FUNC SceSysmem, 0001, F00, 0xb9d5ebde, sceKernelAllocMemBlock
