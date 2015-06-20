/**
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

#ifndef _PSP2_APPUTL_H_
#define _PSP2_APPUTL_H_

#include <psp2/types.h>
#include <stdint.h>

enum SceAppUtilErrorCodes {
	SCE_APPUTIL_ERROR_PARAMETER	= 0x80100600,
	SCE_APPUTIL_ERROR_NOT_INITIALIZED	= 0x80100601,
	SCE_APPUTIL_ERROR_NO_MEMORY	= 0x80100602,
	SCE_APPUTIL_ERROR_BUSY	= 0x80100603,
	SCE_APPUTIL_ERROR_NOT_MOUNTED	= 0x80100604,
	SCE_APPUTIL_ERROR_NO_PERMISSION	= 0x80100605,
	SCE_APPUTIL_ERROR_APPEVENT_PARSE_INVALID_DATA	= 0x80100620,
	SCE_APPUTIL_ERROR_SAVEDATA_SLOT_EXISTS	= 0x80100640,
	SCE_APPUTIL_ERROR_SAVEDATA_SLOT_NOT_FOUND	= 0x80100641,
	SCE_APPUTIL_ERROR_SAVEDATA_NO_SPACE_QUOTA	= 0x80100642,
	SCE_APPUTIL_ERROR_SAVEDATA_NO_SPACE_FS	= 0x80100643,
	SCE_APPUTIL_ERROR_PHOTO_DEVICE_NOT_FOUND	= 0x80100680,
};

typedef unsigned int SceAppUtilBootAttribute;
typedef unsigned int SceAppUtilAppEventType;
typedef unsigned int SceAppUtilSaveDataSlotId;
typedef unsigned int SceAppUtilSaveDataSlotStatus;
typedef unsigned int SceAppUtilSaveDataSaveMode;
typedef unsigned int SceAppUtilSaveDataRemoveMode;
typedef unsigned int SceAppUtilAppParamId;
typedef unsigned int SceAppUtilBgdlStatusType;

typedef struct SceAppUtilInitParam {
	SceSize workBufSize; //!< Buffer size
	uint8_t reserved[60]; //!< Reserved range
};

typedef struct SceAppUtilBootParam {
	SceAppUtilBootAttribute attr; //!< Boot attribute
	unsigned int appVersion; //!< App version
	uint8_t reserved[32]; //!< Reserved range
};

typedef struct SceAppUtilSaveDataMountPoint {
	uint8_t data[16];
};

typedef struct SceAppUtilAppEventParam {
	SceAppUtilAppEventType type; //!< Event type
	uint8_t dat[1024] //!< Event parameter
};

typedef struct SceAppUtilMountPoint {
	int8_t data[16] //!< Mount point
};

typedef struct SceAppUtilSaveDataSlot {
	SceAppUtilSaveDataSlotId id; //!< Slot id
	SceAppUtilSaveDataSlotStatus status; //!< Slot status
	int userParam; //!< Param for free usage
	SceAppUtilSaveDataSlotEmptyParam *emptyParam; //!< Settings for empty slot
};

typedef struct SceAppUtilSaveDataSlotParam {
	SceAppUtilSaveDataSlotStatus status; //!< Status
	SceWChar16 title[32]; //!< Title name
	SceWChar16 subTitle[64]; //!< Subtitle
	SceWChar16 detail[256]; //!< Detail info
	char iconPath[64]; //!< Icon path
	int userParam; //!< User param
	SceSize sizeKB; //!< Data size (In KB)
	SceDateTime modifiedTime; //!< Last modified time
	uint8_t reserved[48]; //!< Reserved range
};

typedef struct SceAppUtilSaveDataSaveItem {
	const char *dataPath; //!< Path to savedata
	const void *buf; //!< Buffer of savedata file
	uint32_t pad; //!< Padding
	SceOff offset; //!< Offset of savedata file
	SceAppUtilSaveDataSaveMode mode; //!< Savedata save mode
	uint8_t reserved[36]; //!< Reserved range
};

typedef struct SceAppUtilSaveDataSlotEmptyParam {
	SceWChar16 *title; //!< Title string
	char *iconPath; //!< Path to icon
	void *iconBuf; //!< Icon buffer
	SceSize iconBufSize; //!< Icon buffer size
	uint8_t reserved[32]; //!< Reserved range
};

typedef struct SceAppUtilSaveDataFile {
	const char *filePath;
	void *buf;
	SceSize bufSize;
	SceOff offset;
	unsigned int mode;
	unsigned int progDelta;
	uint8_t reserved[32];
};

typedef struct SceAppUtilSaveDataFileSlot {
	unsigned int id;
	SceAppUtilSaveDataSlotParam *slotParam;
	uint8_t reserved[32];
};

typedef struct SceAppUtilSaveDataRemoveItem {
	const char *dataPath; //!< Path to savedata data
	SceAppUtilSaveDataRemoveMode mode; //!< Savedata remove mode
	uint8_t reserved[36]; //!< Reserved range
};

typedef struct SceAppUtilStoreBrowseParam {
	unsigned int type; //!< Store browse type
	const char *id; //!< Target id
};

typedef struct SceAppUtilWebBrowserParam {
	const char *str; //!< String that's passed to command specified by launchMode
	SceSize strlen; //!< Length of str
	unsigned int launchMode; //!< Browser mode
	unsigned int reserved; //!< Reserved area
};

//! Initialize AppUtil library
int SceAppUtilInit(SceAppUtilInitParam *initParam, SceAppUtilBootParam *bootParam);

//! Shutdown AppUtil library
int SceAppUtilShutdown();

//! Receive app event
int SceAppUtilRecieveAppEvent(SceAppUtilAppEventParam *eventParam);

//! Create savedata slot
int SceAppUtilSaveDataSlotCreate(unsigned int slotId,
	SceAppUtilSaveDataSlotParam *param,
	SceAppUtilSaveDataMountPoint *mountPoint);

//! Delete savedata slot
int SceAppUtilSaveDataSlotDelete(unsigned int slotId,
	SceAppUtilSaveDataMountPoint *mountPoint);

//! Set savedata slot param
int SceAppUtilSaveDataSlotSetParam(unsigned int slotId,
	SceAppUtilSaveDataSlotParam *param,
	SceAppUtilSaveDataMountPoint *mountPoint);

//! Get savedata slot param
int SceAppUtilSaveDataSlotGetParam(unsigned int slotId,
	SceAppUtilSaveDataSlotParam *param,
	SceAppUtilSaveDataMountPoint *mountPoint);

//!< Write savedata files and directories
int SceAppUtilSaveDataDataSave(SceAppUtilSaveDataFileSlot *slot,
	SceAppUtilSaveDataFile *files, unsigned int fileNum,
	SceAppUtilSaveDataMountPoint *mountPoint,
	SceSize *requiredSizeKB);

//! Mount music data
int SceAppUtilMusicMount();

//! Unmount music data
int SceAppUtilMusicUmount();

//! Mount photo data
int SceAppUtilPhotoMount();

//! Unmount photo data
int SceAppUtilPhotoUmount();

//! Get system parameters for int type
int SceAppUtilSystemParamGetInt(unsigned int paramId, int *value);

//! Get application parameters for string type
int SceAppUtilSystemParamGetString(unsigned int paramId,
	SceWChar16 *buf, SceSize bufSize);

//! Get application parameters for int type
int SceAppUtilParamGetInt(SceAppUtilAppParamId paramId, int *value);

//! Save safe memory
int SceAppUtilSaveSafeMemory(void *buf, SceSize bufSize, SceOff offset);

//! Load safe memory
int SceAppUtilLoadSafeMemory(void *buf, SceSize bufSize, SceOff offset);

//! Launch PSN Store
int SceAppUtilStoreBrowse(SceAppUtilStoreBrowseParam *param);

//! Get background download status
int SceAppUtilBgdlGetStatus(SceAppUtilBgdlStatus *stat);

//! Launch web browser app
int SceAppUtilLaunchWebBrowser(SceAppUtilWebBrowserParam *param);

#endif
