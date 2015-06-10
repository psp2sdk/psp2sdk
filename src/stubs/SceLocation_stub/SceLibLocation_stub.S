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
