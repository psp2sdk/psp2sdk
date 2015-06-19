/**
 * \file
 * \brief Header file which defines RTC variables and functions
 *
 * Copyright (C) 2015 PSP2SDK Project
 *
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef _PSP2_RTC_
#define _PSP2_RTC_

/* struct/union */

typedef struct SceRtcTime {
	unsigned short year;
	unsigned short month;
	unsigned short day;
	unsigned short hour;
	unsigned short minutes;
	unsigned short seconds;
	unsigned int microseconds;
} SceRtcTime;

typedef enum SceRtcCheckValidError {
	SCE_RTC_INVALID_YEAR         = -1,
	SCE_RTC_INVALID_MONTH        = -2,
	SCE_RTC_INVALID_DAY          = -3,
	SCE_RTC_INVALID_HOUR         = -4,
	SCE_RTC_INVALID_MINUTES      = -5,
	SCE_RTC_INVALID_SECONDS      = -6,
	SCE_RTC_INVALID_MICROSECONDS = -7
} SceRtcCheckValidError;

/* prototypes */

unsigned int sceRtcGetTickResolution();
int sceRtcGetCurrentTick(u64 *tick);
int sceRtcGetCurrentClock(SceRtcTime *time, int tz);
int sceRtcGetCurrentClockLocalTime(SceRtcTime *time);

int sceRtcConvertUtcToLocalTime(const u64 *tickUTC, u64 *tickLocal);
int sceRtcConvertLocalTimeToUTC(const u64 *tickLocal, u64 *tickUTC);

int sceRtcIsLeapYear(int year);

int sceRtcGetDaysInMonth(int year, int month);
int sceRtcGetDayOfWeek(int year, int month, int day);

int sceRtcCheckValid(const SceRtcTime *date);

int sceRtcSetTick(SceRtcTime *date, const u64 *tick);
int sceRtcGetTick(const SceRtcTime *date, u64 *tick);
int sceRtcCompareTick(const u64 *tick1, const u64 *tick2);

int sceRtcTickAddTicks(u64 *destTick, const u64 *srcTick, u64 numTicks);
int sceRtcTickAddMicroseconds(u64 *destTick, const u64 *srcTick, u64 numMS);
int sceRtcTickAddSeconds(u64 *destTick, const u64 *srcTick, u64 numSecs);
int sceRtcTickAddMinutes(u64 *destTick, const u64 *srcTick, u64 numMins);
int sceRtcTickAddHours(u64 *destTick, const u64 *srcTick, int numHours);
int sceRtcTickAddDays(u64 *destTick, const u64 *srcTick, int numDays);
int sceRtcTickAddWeeks(u64 *destTick, const u64 *srcTick, int numWeeks);
int sceRtcTickAddMonths(u64 *destTick, const u64 *srcTick, int numMonths);
int sceRtcTickAddYears(u64 *destTick, const u64 *srcTick, int numYears);

int sceRtcSetTime_t(SceRtcTime *date, const time_t time);
int sceRtcGetTime_t(const SceRtcTime *date, time_t *time);
int sceRtcSetDosTime(SceRtcTime *date, unsigned int dosTime);
int sceRtcGetDosTime(SceRtcTime *date, unsigned int dosTime);
int sceRtcSetWin32FileTime(SceRtcTime *date, u64 *win32Time);
int sceRtcGetWin32FileTime(SceRtcTime *date, u64 *win32Time);

int sceRtcParseDateTime(u64 *destTick, const char *dateString);
int sceRtcFormatRFC2822(char *pszDateTime, const u64 *pUtc, int iTimeZoneMinutes);
int sceRtcFormatRFC2822LocalTime(char *pszDateTime, const u64 *pUtc);
int sceRtcFormatRFC3339(char *pszDateTime, const u64 *pUtc, int iTimeZoneMinutes);
int sceRtcFormatRFC3339LocalTime(char *pszDateTime, const u64 *pUtc);
int sceRtcParseRFC3339(u64 *pUtc, const char *pszDateTime);

/* missing prototypes */

// sceRtcGetLastAdjustedTick
// sceRtcSetTime64_t
// sceRtcGetLastReincarnatedTick
// sceRtcGetDayOfYear
// sceRtcGetTime64_t
// sceRtcGetCurrentNetworkTick

#endif
