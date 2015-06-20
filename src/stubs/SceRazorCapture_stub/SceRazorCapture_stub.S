@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceRazorCapture, 0001, 1, 0

PSP2_IMPORT_FUNC SceRazorCapture, 0001, F00, 0x3d4b7e68, sceRazorCaptureSetTriggerNextFrame
PSP2_IMPORT_FUNC SceRazorCapture, 0001, F00, 0x3f0913cf, sceRazorGpuCaptureStartSalvageMode
PSP2_IMPORT_FUNC SceRazorCapture, 0001, F00, 0x472492da, sceRazorGpuCaptureSetTrigger
PSP2_IMPORT_FUNC SceRazorCapture, 0001, F00, 0x6a09822d, sceRazorGpuCaptureSetCaptureAllMemory
PSP2_IMPORT_FUNC SceRazorCapture, 0001, F00, 0x8ee74eb7, sceRazorGpuCaptureSetCaptureBeforeKick
PSP2_IMPORT_FUNC SceRazorCapture, 0001, F00, 0x911e0aa0, sceRazorCaptureIsInProgress
PSP2_IMPORT_FUNC SceRazorCapture, 0001, F00, 0x9daa7e9c, sceRazorGpuCaptureSetTriggerNextFrame
PSP2_IMPORT_FUNC SceRazorCapture, 0001, F00, 0xd2358bfb, sceRazorGpuCaptureIsInProgress
PSP2_IMPORT_FUNC SceRazorCapture, 0001, F00, 0xdfbdcc4c, sceRazorGpuCaptureEnableSalvage
PSP2_IMPORT_FUNC SceRazorCapture, 0001, F00, 0xe916b538, sceRazorCaptureSetTrigger
