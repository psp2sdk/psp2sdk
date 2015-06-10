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

PSP2_IMPORT_HEAD 0x0, SceRazorHud, 0001, 1, 0

PSP2_IMPORT_FUNC SceRazorHud, 0001, F00, 0x29cefdaa, sceRazorGpuLiveSetBuffer
PSP2_IMPORT_FUNC SceRazorHud, 0001, F00, 0x528aa4c7, sceRazorGpuTraceTrigger
PSP2_IMPORT_FUNC SceRazorHud, 0001, F00, 0x6dfbac39, sceRazorCpuHudUserMarkerEnableThreadId
PSP2_IMPORT_FUNC SceRazorHud, 0001, F00, 0x6fd64de6, sceRazorGpuLiveSetMetricsGroup
PSP2_IMPORT_FUNC SceRazorHud, 0001, F00, 0x73f83357, sceRazorGpuTraceRingBufferSize
PSP2_IMPORT_FUNC SceRazorHud, 0001, F00, 0x77f2f606, sceRazorHudSetDisplayEnabled
PSP2_IMPORT_FUNC SceRazorHud, 0001, F00, 0x7a51f1a0, sceRazorGpuTraceRingBufferUsed
PSP2_IMPORT_FUNC SceRazorHud, 0001, F00, 0xb46382fc, sceRazorGpuLiveStart
PSP2_IMPORT_FUNC SceRazorHud, 0001, F00, 0xbcb790e9, sceRazorGpuLiveTriggerDebugDump
PSP2_IMPORT_FUNC SceRazorHud, 0001, F00, 0xbd360a69, sceRazorGpuLiveStop
PSP2_IMPORT_FUNC SceRazorHud, 0001, F00, 0xbfeadb77, sceRazorGpuTraceSetMetricsGroup
PSP2_IMPORT_FUNC SceRazorHud, 0001, F00, 0xcc390860, sceRazorHudSetDisplayFrameCount
PSP2_IMPORT_FUNC SceRazorHud, 0001, F00, 0xdfd00bae, sceRazorHudReloadSettings
PSP2_IMPORT_FUNC SceRazorHud, 0001, F00, 0xe3709b44, sceRazorGpuPerfGetMode
PSP2_IMPORT_FUNC SceRazorHud, 0001, F00, 0xece363ef, sceRazorCpuHudSetUserMarkerTraceBuffer
PSP2_IMPORT_FUNC SceRazorHud, 0001, F00, 0xf867efe1, sceRazorGpuTraceSetFilename
PSP2_IMPORT_FUNC SceRazorHud, 0001, F00, 0xfd290a17, sceRazorCpuHudUserMarkerEnableAllThreads
