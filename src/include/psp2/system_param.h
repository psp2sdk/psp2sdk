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

/* System param id */

enum {
	//!< Language settings
	PSP2_SYSTEM_PARAM_ID_LANG = 1,

	//!< Enter button assignment
	PSP2_SYSTEM_PARAM_ID_ENTER_BUTTON,

	//!< Username string
	PSP2_SYSTEM_PARAM_ID_USERNAME,

	//!< Date format
	PSP2_SYSTEM_PARAM_ID_DATE_FORMAT,

	//!< Time format
	PSP2_SYSTEM_PARAM_ID_TIME_FORMAT,

	//!< Time zone
	PSP2_SYSTEM_PARAM_ID_TIME_ZONE,

	//!< Daylight savings time (0 = Disabled, 1 = Enabled)
	PSP2_SYSTEM_PARAM_ID_DAYLIGHT_SAVINGS
};

/* Language settings */
enum {
	PSP2_SYSTEM_PARAM_LANG_JAPANESE,
	PSP2_SYSTEM_PARAM_LANG_ENGLISH_US,
	PSP2_SYSTEM_PARAM_LANG_FRENCH,
	PSP2_SYSTEM_PARAM_LANG_SPANISH,
	PSP2_SYSTEM_PARAM_LANG_GERMAN,
	PSP2_SYSTEM_PARAM_LANG_ITALIAN,
	PSP2_SYSTEM_PARAM_LANG_DUTCH,
	PSP2_SYSTEM_PARAM_LANG_PORTUGUESE,
	PSP2_SYSTEM_PARAM_LANG_RUSSIAN,
	PSP2_SYSTEM_PARAM_LANG_KOREAN,

	//! Traditional Chinese
	PSP2_SYSTEM_PARAM_LANG_CHINESE_T,

	//! Simplified Chinese
	PSP2_SYSTEM_PARAM_LANG_CHINESE_S,
	PSP2_SYSTEM_PARAM_LANG_FINNISH,
	PSP2_SYSTEM_PARAM_LANG_SWEDISH,
	PSP2_SYSTEM_PARAM_LANG_DANISH,
	PSP2_SYSTEM_PARAM_LANG_NORWEGIAN,
	PSP2_SYSTEM_PARAM_LANG_POLISH,

	//! Brazil Portuguese
	PSP2_SYSTEM_PARAM_LANG_POLISH_BR,

	PSP2_SYSTEM_PARAM_LANG_ENGLISH_GB
};

/* Assignment of enter button */
enum {
	PSP2_SYSTEM_PARAM_ENTER_BUTTON_CIRCLE,
	PSP2_SYSTEM_PARAM_ENTER_BUTTON_CROSS
};

/* Username */
#define SYSTEM_PARAM_USERNAME_MAXSIZE	(17) //!< Max size of username

/* Date display format */
enum {
	PSP2_SYSTEM_PARAM_DATE_FORMAT_YYYYMMDD, //!< Year/Month/Day
	PSP2_SYSTEM_PARAM_DATE_FORMAT_DDMMYYYY, //!< Day/Month/Year
	PSP2_SYSTEM_PARAM_DATE_FORMAT_MMDDYYYY //!< Month/Day/Year
};

/* Time display format */
enum {
	SYSTEM_PARAM_TIME_FORMAT_12HR, //!< 12-hour clock
	SYSTEM_PARAM_TIME_FORMAT_24HR //!< 24-hour clock
};

#endif
