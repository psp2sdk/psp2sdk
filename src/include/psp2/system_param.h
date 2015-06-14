/**
 * \file
 * \brief Header file which defines output audio related variables and functions
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

#ifndef _PSP2_SYSTEM_PARAM_H_
#define _PSP2_SYSTEM_PARAM_H_

#include <psp2/types.h>

/* System param id */
typedef uint32_t SystemParamId;
#define SYSTEM_PARAM_ID_LANG	(1) //!< Language settings
#define SYSTEM_PARAM_ID_ENTER_BUTTON	(2) //!< Enter button assignment
#define SYSTEM_PARAM_ID_USERNAME	(3) //!< Username string
#define SYSTEM_PARAM_ID_DATE_FORMAT	(4) //!< Date format
#define SYSTEM_PARAM_ID_TIME_FORMAT	(5) //!< Time format
#define SYSTEM_PARAM_ID_TIME_ZONE	(6) //!< Time zone
#define SYSTEM_PARAM_ID_DAYLIGHT_SAVINGS	(7) //!< Daylight savings time (0=Disabled 1=Enabled)

/* Language settings */
typedef int32_t SystemParamLang;
#define SYSTEM_PARAM_LANG_JAPANESE	(0)
#define SYSTEM_PARAM_LANG_ENGLISH_US	(1)
#define SYSTEM_PARAM_LANG_FRENCH	(2)
#define SYSTEM_PARAM_LANG_SPANISH	(3)
#define SYSTEM_PARAM_LANG_GERMAN	(4)
#define SYSTEM_PARAM_LANG_ITALIAN	(5)
#define SYSTEM_PARAM_LANG_DUTCH	(6)
#define SYSTEM_PARAM_LANG_PORTUGUESE	(7)
#define SYSTEM_PARAM_LANG_RUSSIAN	(8)
#define SYSTEM_PARAM_LANG_KOREAN	(9)
#define SYSTEM_PARAM_LANG_CHINESE_T	(10) //!< Traditional Chinese
#define SYSTEM_PARAM_LANG_CHINESE_S	(11) //!< Simplified Chinese
#define SYSTEM_PARAM_LANG_FINNISH	(12)
#define SYSTEM_PARAM_LANG_SWEDISH	(13)
#define SYSTEM_PARAM_LANG_DANISH	(14)
#define SYSTEM_PARAM_LANG_NORWEGIAN	(15)
#define SYSTEM_PARAM_LANG_POLISH	(16)
#define SYSTEM_PARAM_LANG_POLISH_BR	(17) //!< Brazil Portuguese
#define SYSTEM_PARAM_LANG_ENGLISH_GB	(18)

/* Assignment of enter button */
typedef int32_t SystemParamEnterButton;
#define SYSTEM_PARAM_ENTER_BUTTON_CIRCLE	(0)
#define SYSTEM_PARAM_ENTER_BUTTON_CROSS (1)

/* Username */
#define SYSTEM_PARAM_USERNAME_MAXSIZE	(17) //!< Max size of username

/* Date display format */
#define SYSTEM_PARAM_DATE_FORMAT_YYYYMMDD	(0) //!< Year/Month/Day
#define SYSTEM_PARAM_DATE_FORMAT_DDMMYYYY	(1) //!< Day/Month/Year
#define SYSTEM_PARAM_DATE_FORMAT_MMDDYYYY	(2) //!< Month/Day/Year

/* Time display format */
#define SYSTEM_PARAM_TIME_FORMAT_12HR	(0) //!< 12-hour clock
#define SYSTEM_PARAM_TIME_FORMAT_24HR	(1) //!< 24-hour clock

#endif
