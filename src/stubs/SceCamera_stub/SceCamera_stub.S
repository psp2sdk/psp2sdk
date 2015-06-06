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

PSP2_IMPORT_HEAD 0x0, SceCamera, 0001, 1, 0

PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0x06d3816c, sceCameraGetZoom
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0x06fb2900, sceCameraSetContrast
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0x103a75b8, sceCameraIsActive
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0x1175f477, sceCameraSetReverse
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0x12b6ff26, sceCameraGetNightmode
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0x1dd9c9ce, sceCameraStop
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0x233c9e27, sceCameraSetNoiseReductionForDebug
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0x27bb0528, sceCameraGetNoiseReductionForDebug
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0x2c36d6f3, sceCameraGetGain
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0x3cf630a1, sceCameraSetISO
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0x3f26233e, sceCameraSetNightmode
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0x44f6043f, sceCameraGetReverse
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0x4d4514ac, sceCameraSetWhiteBalance
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0x4ebd5c68, sceCameraGetISO
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0x624f7653, sceCameraGetSaturation
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0x62aff0b8, sceCameraSetEV
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0x7670474c, sceCameraUseCacheMemoryForTrial
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0x79b5c2de, sceCameraRead
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0x7e8ef3b2, sceCameraGetEffect
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0x85d5951d, sceCameraGetBrightness
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0x89b16030, sceCameraLedBlink
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0x8b5e6147, sceCameraGetEV
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0x8dd1292b, sceCameraGetBacklight
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0x8fbe84be, sceCameraGetContrast
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0x98d71588, sceCameraSetBrightness
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0x9fdacb99, sceCameraGetAntiFlicker
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0xa462f801, sceCameraOpen
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0xa8feae35, sceCameraStart
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0xaa72c3dc, sceCameraGetSharpness
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0xae071044, sceCameraSetBacklight
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0xc387f4dc, sceCameraGetSharpnessOffForDebug
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0xcd6e1cfc, sceCameraClose
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0xd02cfa5c, sceCameraLedSwitch
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0xd1a5bb0b, sceCameraSetSharpness
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0xdbffa1da, sceCameraGetWhiteBalance
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0xe22c2375, sceCameraSetSharpnessOffForDebug
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0xe312958a, sceCameraSetAntiFlicker
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0xe65cfe86, sceCameraSetGain
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0xe9d2cfb1, sceCameraSetEffect
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0xf7464216, sceCameraSetZoom
PSP2_IMPORT_FUNC SceCamera, 0001, F00, 0xf9f7ca3d, sceCameraSetSaturation
