@ Copyright (C) 2015 PSP2SDK Project
@
@ This library is free software; you can redistribute it and/or
@ modify it under the terms of the GNU Lesser General Public
@ License version 2.1 as published by the Free Software Foundation
@
@ This library is distributed in the hope that it will be useful,
@ but WITHOUT ANY WARRANTY; without even the implied warranty of
@ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
@ Lesser General Public License for more details.
@
@ You should have received a copy of the GNU Lesser General Public
@ License along with this library; if not, write to the Free Software
@ Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

#include <psp2import.S>

PSP2_IMPORT_HEAD 0x0, ScePerf, 0001, 1, 0

PSP2_IMPORT_FUNC ScePerf, 0001, F00, 0x12f6c708, scePerfArmPmonSetCounterValue
PSP2_IMPORT_FUNC ScePerf, 0001, F00, 0x35151735, scePerfArmPmonReset
PSP2_IMPORT_FUNC ScePerf, 0001, F00, 0x4264b4e7, scePerfArmPmonSoftwareIncrement
PSP2_IMPORT_FUNC ScePerf, 0001, F00, 0x4f1385e3, sceRazorCpuSync
PSP2_IMPORT_FUNC ScePerf, 0001, F00, 0x6132a497, scePerfArmPmonGetCounterValue
PSP2_IMPORT_FUNC ScePerf, 0001, F00, 0x63cbea8b, scePerfArmPmonSelectEvent
PSP2_IMPORT_FUNC ScePerf, 0001, F00, 0x78ea4ffb, scePerfGetTimebaseFrequency
PSP2_IMPORT_FUNC ScePerf, 0001, F00, 0x7ad6ac30, _sceRazorCpuInit
PSP2_IMPORT_FUNC ScePerf, 0001, F00, 0xbd9615e5, scePerfGetTimebaseValue
PSP2_IMPORT_FUNC ScePerf, 0001, F00, 0xc3de4c0a, sceRazorCpuPushMarker
PSP2_IMPORT_FUNC ScePerf, 0001, F00, 0xc9d969d5, scePerfArmPmonStart
PSP2_IMPORT_FUNC ScePerf, 0001, F00, 0xd1a40f54, scePerfArmPmonStop
PSP2_IMPORT_FUNC ScePerf, 0001, F00, 0xdc3224c3, sceRazorCpuPopMarker
