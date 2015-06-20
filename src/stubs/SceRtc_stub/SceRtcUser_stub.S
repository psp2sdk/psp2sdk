@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceRtcUser, 0001, 1, 0

PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0x0572eddc, sceRtcGetCurrentClockLocalTime
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0x0a05e201, sceRtcConvertLocalTimeToUtc
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0x1282c436, sceRtcConvertUtcToLocalTime
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0x147f2138, sceRtcFormatRFC2822
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0x2347ce12, sceRtcParseDateTime
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0x23f79274, sceRtcGetCurrentTick
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0x2d18aeec, sceRtcParseRFC3339
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0x2f3531eb, sceRtcGetDayOfWeek
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0x3a332f81, sceRtcSetTime_t
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0x42ca8eb5, sceRtcFormatRFC2822LocalTime
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0x4559e2db, sceRtcTickAddTicks
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0x49eb4556, sceRtcGetDaysInMonth
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0x4c358871, sceRtcTickAddMinutes
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0x58de3c70, sceRtcTickAddDays
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0x6321b4aa, sceRtcTickAddMonths
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0x6f193f55, sceRtcTickAddHours
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0x70fde8f1, sceRtcGetCurrentClock
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0x742250a9, sceRtcFormatRFC3339LocalTime
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0x811313b3, sceRtcGetTickResolution
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0x8148e95c, sceRtcGetLastAdjustedTick
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0x8a95e119, sceRtcGetWin32FileTime
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0x8de6feb7, sceRtcGetTime_t
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0x92abebaf, sceRtcGetDosTime
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0x979afd79, sceRtcTickAddSeconds
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0xa6c36b6a, sceRtcSetTime64_t
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0xa79a8846, sceRtcSetWin32FileTime
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0xa8c16615, sceRtcGetLastReincarnatedTick
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0xae26d920, sceRtcTickAddMicroseconds
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0xb5c4e95f, sceRtcGetDayOfYear
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0xc7385158, sceRtcCompareTick
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0xc995de02, sceRtcGetTime64_t
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0xccea2b54, sceRtcFormatRFC3339
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0xcd89f464, sceRtcSetTick
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0xcddd25fe, sceRtcGetCurrentNetworkTick
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0xd7622935, sceRtcCheckValid
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0xdf6c3e1b, sceRtcTickAddYears
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0xe713c640, sceRtcTickAddWeeks
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0xf17fd8b5, sceRtcIsLeapYear
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0xf2b238e2, sceRtcGetTick
PSP2_IMPORT_FUNC SceRtcUser, 0001, F00, 0xf8b22b07, sceRtcSetDosTime
