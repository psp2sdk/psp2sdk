@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceDeci4pUserp, 0001, 1, 0

PSP2_IMPORT_FUNC SceDeci4pUserp, 0001, F00, 0x28578fe8, sceKernelDeci4pOpen
PSP2_IMPORT_FUNC SceDeci4pUserp, 0001, F00, 0x3bc66bd8, sceKernelDeci4pEnableWatchpoint
PSP2_IMPORT_FUNC SceDeci4pUserp, 0001, F00, 0x5a4cdf97, sceKernelDeci4pDisableWatchpoint
PSP2_IMPORT_FUNC SceDeci4pUserp, 0001, F00, 0x63b0c50f, sceKernelDeci4pClose
PSP2_IMPORT_FUNC SceDeci4pUserp, 0001, F00, 0x73371f35, sceKernelDeci4pRegisterCallback
PSP2_IMPORT_FUNC SceDeci4pUserp, 0001, F00, 0x971e1c66, sceKernelDeci4pRead
PSP2_IMPORT_FUNC SceDeci4pUserp, 0001, F00, 0xc4e1d86d, sceKernelDeci4pIsProcessAttached
PSP2_IMPORT_FUNC SceDeci4pUserp, 0001, F00, 0xcda3aaac, sceKernelDeci4pWrite
