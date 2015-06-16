/**
 * \file
 * \brief Header file which defines camera related variables and functions
 *
 * Copyright (C); 2015 PSP2SDK Project
 *
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option); any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef _PSP2_CAMERA_H_
#define _PSP2_CAMERA_H_

#include <psp2/types.h>

enum CameraErrorCodes {
	SCE_CAMERA_ERROR_ALREADY_INIT	= 0x802e0001,
	SCE_CAMERA_ERROR_NOT_INIT	= 0x802e0002,
	SCE_CAMERA_ERROR_ALREADY_OPEN	= 0x802e0003,
	SCE_CAMERA_ERROR_NOT_OPEN	= 0x802e0004,
	SCE_CAMERA_ERROR_ALREADY_START	= 0x802e0005,
	SCE_CAMERA_ERROR_NOT_START	= 0x802e0006,
	SCE_CAMERA_ERROR_FORMAT_UNKNOWN	= 0x802e0007,
	SCE_CAMERA_ERROR_RESOLUTION_UNKNOWN	= 0x802e0008,
	SCE_CAMERA_ERROR_BAD_FRAMERATE	= 0x802e0009,
	SCE_CAMERA_ERROR_TIMEOUT	= 0x802e000a,
	SCE_CAMERA_ERROR_EXCLUSIVE	= 0x802e000b,
	SCE_CAMERA_ERROR_ATTRIBUTE_UNKNOWN	= 0x802e000c,
	SCE_CAMERA_ERROR_MAX_PROCESS	= 0x802e000d,
	SCE_CAMERA_ERROR_NOT_ACTIVE	= 0x802e000e,
	SCE_CAMERA_ERROR_FATAL	= 0x802e00ff
};

typedef struct SceCameraInfo
{
	uint32_t sizeThis;
	uint32_t wPriority;
	uint32_t wFormat;
	uint32_t wResolution;
	uint32_t wFramerate;
	uint32_t wWidth;
	uint32_t wHeight;
	uint32_t wRange;
	uint32_t _padding_0;
	uint32_t sizeIBase;
	uint32_t sizeUBase;
	uint32_t sizeVBase;
	void *pvIBase;
	void *pvUBase;
	void *pvVBase;
	uint32_t wPitch;
	uint32_t wBuffer;
};

typedef struct SceCameraRead
{
	uint32_t sizeThis;
	int32_t dwMode;
	int32_t _padding_0;
	int32_t dwStatus;
	uint32_t qwFrame;
	uint32_t qwTimestamp;
	uint32_t sizeIBase;
	uint32_t sizeUBase;
	uint32_t sizeVBase;
	void *pvIBase;
	void *pvUBase;
	void *pvVBase;
};

int32_t sceCameraOpen(int32_t devnum, SceCameraInfo *pInfo);


int32_t sceCameraClose(int32_t devnum);


int32_t sceCameraStart(int32_t devnum);


int32_t sceCameraStop(int32_t devnum);


int32_t sceCameraRead(int32_t devnum, SceCameraRead *pRead);


int32_t sceCameraIsActive(int32_t devnum);


int32_t sceCameraGetSaturation(int32_t devnum, int32_t *pLevel);


int32_t sceCameraSetSaturation(int32_t devnum, int32_t level);


int32_t sceCameraGetBrightness(int32_t devnum, int32_t *pLevel);


int32_t sceCameraSetBrightness(int32_t devnum, int32_t level);


int32_t sceCameraGetContrast(int32_t devnum, int32_t *pLevel);


int32_t sceCameraSetContrast(int32_t devnum, int32_t level);


int32_t sceCameraGetSharpness(int32_t devnum, int32_t *pLevel);


int32_t sceCameraSetSharpness(int32_t devnum, int32_t level);


int32_t sceCameraGetReverse(int32_t devnum, int32_t *pMode);


int32_t sceCameraSetReverse(int32_t devnum, int32_t mode);


int32_t sceCameraGetEffect(int32_t devnum, int32_t *pMode);


int32_t sceCameraSetEffect(int32_t devnum, int32_t mode);


int32_t sceCameraGetEV(int32_t devnum, int32_t *pLevel);


int32_t sceCameraSetEV(int32_t devnum, int32_t level);


int32_t sceCameraGetZoom(int32_t devnum, int32_t *pLevel);


int32_t sceCameraSetZoom(int32_t devnum, int32_t level);


int32_t sceCameraGetAntiFlicker(int32_t devnum, int32_t *pMode);


int32_t sceCameraSetAntiFlicker(int32_t devnum, int32_t mode);


int32_t sceCameraGetISO(int32_t devnum, int32_t *pMode);


int32_t sceCameraSetISO(int32_t devnum, int32_t mode);


int32_t sceCameraGetGain(int32_t devnum, int32_t *pMode);


int32_t sceCameraSetGain(int32_t devnum, int32_t mode);


int32_t sceCameraGetWhiteBalance(int32_t devnum, int32_t *pMode);


int32_t sceCameraSetWhiteBalance(int32_t devnum, int32_t mode);


int32_t sceCameraGetBacklight(int32_t devnum, int32_t *pMode);


int32_t sceCameraSetBacklight(int32_t devnum, int32_t mode);


int32_t sceCameraGetNightmode(int32_t devnum, int32_t *pMode);


int32_t sceCameraSetNightmode(int32_t devnum, int32_t mode);


int32_t sceCameraGetExposureCeiling(int32_t devnum, int32_t *pMode);


int32_t sceCameraSetExposureCeiling(int32_t devnum, int32_t mode);


int32_t sceCameraGetAutoControlHold(int32_t devnum, int32_t *pMode);


int32_t sceCameraSetAutoControlHold(int32_t devnum, int32_t mode);


int32_t sceCameraGetEV(int32_t devnum, int32_t *pMode);


int32_t sceCameraSetEV(int32_t devnum, int32_t mode);


int32_t sceCameraGetDeviceLocation(int32_t devnum, SceFVector3 *pLocation);


#endif
