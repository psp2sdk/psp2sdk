/**
 * \file
 * \brief Header file which defines control related variables and functions
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

#ifndef _SCREENSHOT_ERROR_H
#define _SCREENSHOT_ERROR_H

enum ScreenshotErrorCodes {
	SCE_SCREENSHOT_ERROR_INVALID_ARGUMENT	= 0x80102f01,
	SCE_SCREENSHOT_ERROR_NO_MEMORY	= 0x80102f02,
	SCE_SCREENSHOT_ERROR_FILE_NOT_FOUND	= 0x80102f03,
	SCE_SCREENSHOT_ERROR_NOT_SUPPORTED_FORMAT	= 0x80102f04,
	SCE_SCREENSHOT_ERROR_MEDIA_FULL	= 0x80102f05,
	SCE_SCREENSHOT_ERROR_INTERNAL	= 0x80102f06
};

#endif
