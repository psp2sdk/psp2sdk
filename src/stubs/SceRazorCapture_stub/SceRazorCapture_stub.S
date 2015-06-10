@ Copyright (C) 2015 PSP2SDK Project
@
@ This library is free software: you can redistribute it and/or modify
@ it under the terms of the GNU Lesser General Public License as published by
@ the Free Software Foundation, either version 3 of the License, or
@ (at your option) any later version.
@
@ This libary is distributed in the hope that it will be useful,
@ but WITHOUT ANY WARRANTY; without even the implied warranty of
@ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
@ GNU Lesser General Public License for more details.
@
@ You should have received a copy of the GNU Lesser General Public License
@ along with this program.  If not, see <http://www.gnu.org/licenses/>.

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
