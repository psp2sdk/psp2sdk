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
#include <stdint.h>

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
	SceSize size;
	unsigned int priority;
	unsigned int format;
	unsigned int resolution;
	unsigned int framerate;
	unsigned int width;
	unsigned int height;
	unsigned int range;
	unsigned int pad;
	SceSize sizeIBase;
	SceSize sizeUBase;
	SceSize sizeVBase;
	void *pIBase;
	void *pUBase;
	void *pVBase;
	unsigned int pitch;
	void *buffer;
};

typedef struct SceCameraRead
{
	SceSize size;
	int mode;
	uint32_t pad;
	int status;
	unsigned int frame;
	unsigned int timestamp;
	SceSize sizeIBase;
	SceSize sizeUBase;
	SceSize sizeVBase;
	void *pIBase;
	void *pUBase;
	void *pVBase;
};

int sceCameraOpen(int devnum, SceCameraInfo *pInfo);
int sceCameraClose(int devnum);
int sceCameraStart(int devnum);
int sceCameraStop(int devnum);
int sceCameraRead(int devnum, SceCameraRead *pRead);
int sceCameraIsActive(int devnum);
int sceCameraGetSaturation(int devnum, int *pLevel);
int sceCameraSetSaturation(int devnum, int level);
int sceCameraGetBrightness(int devnum, int *pLevel);
int sceCameraSetBrightness(int devnum, int level);
int sceCameraGetContrast(int devnum, int *pLevel);
int sceCameraSetContrast(int devnum, int level);
int sceCameraGetSharpness(int devnum, int *pLevel);
int sceCameraSetSharpness(int devnum, int level);
int sceCameraGetReverse(int devnum, int *pMode);
int sceCameraSetReverse(int devnum, int mode);
int sceCameraGetEffect(int devnum, int *pMode);
int sceCameraSetEffect(int devnum, int mode);
int sceCameraGetEV(int devnum, int *pLevel);
int sceCameraSetEV(int devnum, int level);
int sceCameraGetZoom(int devnum, int *pLevel);
int sceCameraSetZoom(int devnum, int level);
int sceCameraGetAntiFlicker(int devnum, int *pMode);
int sceCameraSetAntiFlicker(int devnum, int mode);
int sceCameraGetISO(int devnum, int *pMode);
int sceCameraSetISO(int devnum, int mode);
int sceCameraGetGain(int devnum, int *pMode);
int sceCameraSetGain(int devnum, int mode);
int sceCameraGetWhiteBalance(int devnum, int *pMode);
int sceCameraSetWhiteBalance(int devnum, int mode);
int sceCameraGetBacklight(int devnum, int *pMode);
int sceCameraSetBacklight(int devnum, int mode);
int sceCameraGetNightmode(int devnum, int *pMode);
int sceCameraSetNightmode(int devnum, int mode);
int sceCameraGetExposureCeiling(int devnum, int *pMode);
int sceCameraSetExposureCeiling(int devnum, int mode);
int sceCameraGetAutoControlHold(int devnum, int *pMode);
int sceCameraSetAutoControlHold(int devnum, int mode);
int sceCameraGetEV(int devnum, int *pMode);
int sceCameraSetEV(int devnum, int mode);
int sceCameraGetDeviceLocation(int devnum, SceFVector3 *pLocation);

#endif
