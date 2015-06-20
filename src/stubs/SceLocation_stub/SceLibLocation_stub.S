@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceLibLocation, 0001, 1, 0

PSP2_IMPORT_FUNC SceLibLocation, 0001, F00, 0x07d4dfe0, sceLocationStartHeadingCallback
PSP2_IMPORT_FUNC SceLibLocation, 0001, F00, 0x09c4f674, sceLocationInit
PSP2_IMPORT_FUNC SceLibLocation, 0001, F00, 0x12d1f0ea, sceLocationStartLocationCallback
PSP2_IMPORT_FUNC SceLibLocation, 0001, F00, 0x14fe76e8, sceLocationClose
PSP2_IMPORT_FUNC SceLibLocation, 0001, F00, 0x15bc27c8, sceLocationGetLocation
PSP2_IMPORT_FUNC SceLibLocation, 0001, F00, 0x16f41ed0, sceLocationGetLocationWithTimeout
PSP2_IMPORT_FUNC SceLibLocation, 0001, F00, 0x188ce004, sceLocationGetMethod
PSP2_IMPORT_FUNC SceLibLocation, 0001, F00, 0x1e80199a, sceLocationTerm
PSP2_IMPORT_FUNC SceLibLocation, 0001, F00, 0x482622c6, sceLocationGetPermission
PSP2_IMPORT_FUNC SceLibLocation, 0001, F00, 0x4e9e5ed9, sceLocationGetHeading
PSP2_IMPORT_FUNC SceLibLocation, 0001, F00, 0x71503251, sceLocationCancelGetLocation
PSP2_IMPORT_FUNC SceLibLocation, 0001, F00, 0x730ff842, sceLocationConfirmGetStatus
PSP2_IMPORT_FUNC SceLibLocation, 0001, F00, 0x8aaf3fbd, sceLocationDenyApplication
PSP2_IMPORT_FUNC SceLibLocation, 0001, F00, 0x92e53f94, sceLocationStopHeadingCallback
PSP2_IMPORT_FUNC SceLibLocation, 0001, F00, 0xaa026b53, sceLocationSetThreadParameter
PSP2_IMPORT_FUNC SceLibLocation, 0001, F00, 0xb1f55065, sceLocationReopen
PSP2_IMPORT_FUNC SceLibLocation, 0001, F00, 0xc895e567, sceLocationConfirm
PSP2_IMPORT_FUNC SceLibLocation, 0001, F00, 0xdd271661, sceLocationOpen
PSP2_IMPORT_FUNC SceLibLocation, 0001, F00, 0xde0a9ea4, sceLocationSetGpsEmulationFile
PSP2_IMPORT_FUNC SceLibLocation, 0001, F00, 0xe3cbf875, sceLocationConfirmAbort
PSP2_IMPORT_FUNC SceLibLocation, 0001, F00, 0xed378700, sceLocationStopLocationCallback
PSP2_IMPORT_FUNC SceLibLocation, 0001, F00, 0xff016c13, sceLocationConfirmGetResult
