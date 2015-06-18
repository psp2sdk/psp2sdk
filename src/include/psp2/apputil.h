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

typedef uint32_t SceAppUtilBootAttribute;
typedef uint32_t SceAppUtilAppEventType;
typedef uint32_t SceAppUtilSavedataSlotId;
typedef uint32_t SceAppUtilSavedataSlotStatus;
typedef uint32_t SceAppUtilSavedataSaveMode;
typedef uint32_t SceAppUtilSavedataRemoveMode;
typedef uint32_t SceAppUtilAppParamId;
typedef uint32_t SceAppUtilBgdlStatusType;

typedef struct SceAppUtilInitParam {
	uint32_t workBufSize; //!< Buffer size
	uint8_t reserved[60]; //!< Reserved range
};

typedef struct SceAppUtilBootParam {
	SceAppUtilBootAttribute attr; //!< Boot attribute
	uint32_t appVersion; //!< App version
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
	SceAppUtilSavedataSlotId id; //!< Slot id
	SceAppUtilSavedataSlotStatus status; //!< Slot status
	int32_t userParam; //!< Param for free usage
	SceAppUtilSaveDataSlotEmptyParam *emptyParam; //!< Settings for empty slot
};

typedef struct SceAppUtilSaveDataSlotParam {
	SceAppUtilSavedataSlotStatus status; //!< Status
	uint8_t title[64]; //!< Title name
	uint8_t subTitle[128]; //!< Subtitle
	uint8_t detail[512]; //!< Detail info
	uint8_t iconPath[64]; //!< Icon path
	int32_t userParam; //!< User param
	uint32_t sizeKB; //!< Data size (In KB)
	SceDateTime modifiedTime; //!< Last modified time
	uint8_t reserved[48]; //!< Reserved range
};

typedef struct SceAppUtilSavedataSaveItem {
	const int8_t *dataPath; //!< Path to savedata
	const void *buf; //!< Buffer of savedata file
	int8_t padding[4]; //!< Padding
	SceOff offset; //!< Offset of savedata file
	SceAppUtilSavedataSaveMode mode; //!< Savedata save mode
	int8_t reserved[36]; //!< Reserved range
};

typedef struct SceAppUtilSaveDataSlotEmptyParam {
	int8_t *title; //!< Title string
	int8_t *iconPath; //!< Path to icon
	void *iconBuf; //!< Icon buffer
	uint32_t iconBufSize; //!< Icon buffer size
	uint8_t reserved[32]; //!< Reserved range
};

typedef struct SceAppUtilSaveDataFile {
	const int8_t* filePath;
	void* buf;
	uint32_t bufSize;
	int64_t offset;
	uint32_t mode;
	uint32_t progDelta;
	uint8_t reserved[32];
};

typedef struct SceAppUtilSaveDataFileSlot {
	uint32_t id;
	SceAppUtilSaveDataSlotParam *slotParam;
	uint8_t reserved[32];
};

typedef struct SceAppUtilSavedataRemoveItem {
	const int8_t *dataPath; //!< Path to savedata data
	SceAppUtilSavedataRemoveMode mode; //!< Savedata remove mode
	int8_t reserved[36]; //!< Reserved range
};

typedef struct SceAppUtilStoreBrowseParam {
	uint32_t type; //!< Store browse type
	const int8_t *id; //!< Target id
};

typedef struct SceAppUtilWebBrowserParam {
	const int8_t str; //!< String that's passed to command specified by launchMode
	uint32_t strlen; //!< Length of str
	uint32_t launchMode; //!< Browser mode
	uint32_t reserved0; //!< Reserved area
};

int32_t SceAppUtilInit(SceAppUtilInitParam *initParam, SceAppUtilBootParam *bootParam); //!< Initialize AppUtil library

int32_t SceAppUtilShutdown(); //!< Shutdown AppUtil library

int32_t SceAppUtilRecieveAppEvent(SceAppUtilAppEventParam *eventParam);  //!< Receive app event

int32_t SceAppUtilSaveDataSlotCreate(uint32_t slotId,SceAppUtilSaveDataSlotParam *param, SceAppUtilSaveDataMountPoint *mountPoint); //!< Create savedata slot

int32_t SceAppUtilSaveDataSlotDelete(uint32_t slotId, SceAppUtilSaveDataMountPoint *mountPoint); //!< Delete savedata slot

int32_t SceAppUtilSaveDataSlotSetParam(uint32_t slotId, SceAppUtilSaveDataSlotParam *param, SceAppUtilSaveDataMountPoint *mountPoint); //!< Set savedata slot param

int32_t SceAppUtilSaveDataSlotGetParam(uint32_t slotId, SceAppUtilSaveDataSlotParam *param, SceAppUtilSaveDataMountPoint *mountPoint); //!< Get savedata slot param

int32_t SceAppUtilSaveDataDataSave(SceAppUtilSaveDataFileSlot *slot, SceAppUtilSaveDataFile *files, uint32_t fileNum, SceAppUtilSaveDataMountPoint *mountPoint, uint32_t *requiredSizeKB); //!< Write savedata files and directories

int32_t SceAppUtilMusicMount(); //!< Mount music data

int32_t SceAppUtilMusicUmount(); //!< Unmount music data

int32_t SceAppUtilPhotoMount(); //!< Mount photo data

int32_t SceAppUtilPhotoUmount(); //!< Unmount photo data

int32_t SceAppUtilSystemParamGetInt(uint32_t paramId, int32_t *value); //!< Get system parameters for int type

int32_t SceAppUtilSystemParamGetString(uint32_t paramId, int8_t *buf, uint32_t bufSize); //!< Get application parameters for string type

int32_t SceAppUtilParamGetInt(SceAppUtilAppParamId paramId, int32_t *value); //!< Get application parameters for int type

int32_t SceAppUtilSaveSafeMemory(void *buf, uint32_t bufSize, int64_t offset); //!< Save save memory

int32_t SceAppUtilLoadSafeMemory(void *buf, uint32_t bufSize, int64_t offset); //!< Load safe memory

int32_t SceAppUtilStoreBrowse(SceAppUtilStoreBrowseParam *param); //!< Launch PSN Store

int32_t SceAppUtilBgdlGetStatus(SceAppUtilBgdlStatus *stat); //!< Get background download status

int32_t SceAppUtilLaunchWebBrowser(SceAppUtilWebBrowserParam *param); //!< Launch web browser app

#endif
