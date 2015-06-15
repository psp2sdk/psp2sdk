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

#ifndef _PSP2_APPUTL_H_
#define _PSP2_APPUTL_H_

#include <psp2/types.h>

enum AppUtilErrorCodes {
	SCE_APPUTIL_ERROR_PARAMETER	= 0x80100600,
	SCE_APPUTIL_ERROR_NOT_INITIALIZED	= 0x80100601,
	SCE_APPUTIL_ERROR_NO_MEMORY	= 0x80100602,
	SCE_APPUTIL_ERROR_BUSY	= 0x80100603,
	SCE_APPUTIL_ERROR_NOT_MOUNTED	= 0x80100604,
	SCE_APPUTIL_ERROR_SAVEDATA_SLOT_EXISTS	= 0x80100640,
	SCE_APPUTIL_ERROR_SAVEDATA_SLOT_NOT_FOUND	= 0x80100641,
	SCE_APPUTIL_ERROR_SAVEDATA_NO_SPACE	= 0x80100642
};


typedef struct SceAppUtilInitParam
{
	uint32_t workBufSize;
	uint8_t reserved[60];
};

typedef struct SceAppUtilBootParam
{
	uint32_t attr;
	uint32_t appVersion;
	uint8_t reserved[32];
};

typedef struct SceAppUtilSaveDataMountPoint
{
	uint8_t data[16];
};

typedef struct SceAppUtilSaveDataSlotParam
{
	uint32_t status;
	uint8_t title[64];
	uint8_t subTitle[128];
	uint8_t detail[512];
	uint8_t iconPath[64];
	int32_t userParam;
	uint32_t sizeKB;
	SceDateTime modifiedTime;
	uint8_t reserved[48];
};

typedef struct SceAppUtilSaveDataSlotEmptyParam
{
	int8_t *title;
	int8_t *iconPath;
	void *iconBuf;
	uint32_t iconBufSize;
	uint8_t reserved[32];
};

typedef struct SceAppUtilSaveDataSlot
{
	uint32_t id;
	uint32_t status;
	int32_t userParam;
	SceAppUtilSaveDataSlotEmptyParam *emptyParam;
};

typedef struct SceAppUtilSaveDataFile
{
	const int8_t* filePath;
	void* buf;
	uint32_t bufSize;
	int64_t offset;
	uint32_t mode;
	uint32_t progDelta;
	uint8_t reserved[32];
};

typedef struct SceAppUtilSaveDataFileSlot
{
	uint32_t id;
	SceAppUtilSaveDataSlotParam *slotParam;
	uint8_t reserved[32];
};

int32_t sceAppUtilInit(SceAppUtilInitParam *initParam, SceAppUtilBootParam *bootParam);

int32_t sceAppUtilShutdown();

int32_t sceAppUtilSaveDataSlotCreate(uint32_t slotId,SceAppUtilSaveDataSlotParam *param, SceAppUtilSaveDataMountPoint *mountPoint);

int32_t sceAppUtilSaveDataSlotDelete(uint32_t slotId, SceAppUtilSaveDataMountPoint *mountPoint);

int32_t sceAppUtilSaveDataSlotSetParam(uint32_t slotId, SceAppUtilSaveDataSlotParam *param, SceAppUtilSaveDataMountPoint *mountPoint);

int32_t sceAppUtilSaveDataSlotGetParam(uint32_t slotId, SceAppUtilSaveDataSlotParam *param, SceAppUtilSaveDataMountPoint *mountPoint);

//sceAppUtilSaveDataFileSave ???
int32_t sceAppUtilSaveDataDataSave(SceAppUtilSaveDataFileSlot *slot, SceAppUtilSaveDataFile *files, uint32_t fileNum, SceAppUtilSaveDataMountPoint *mountPoint, uint32_t *requiredSizeKB);

int32_t sceAppUtilMusicMount();

int32_t sceAppUtilMusicUmount();

int32_t sceAppUtilPhotoMount();

int32_t sceAppUtilPhotoUmount();

int32_t sceAppUtilSystemParamGetInt(uint32_t paramId, int32_t *value);

int32_t sceAppUtilSystemParamGetString(uint32_t paramId, int8_t *buf, uint32_t bufSize);

int32_t sceAppUtilSaveSafeMemory(void *buf, uint32_t bufSize, int64_t offset);

int32_t sceAppUtilLoadSafeMemory(void *buf, uint32_t bufSize, int64_t offset);


/** Missing Functions
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x0f4ee55f, sceAppUtilAppEventParseLiveArea
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x1b36af8c, sceAppUtilAddcontUmount
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x22297d59, sceAppUtilAppEventParseIncomingDialog
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x28c7d4f6, sceAppUtilAppEventParseNpBasicJoinablePresence
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x2af42d6a, sceAppUtilAppEventParseScreenShotNotification
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x2db7be3b, sceAppUtilDrmOpen
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x4faad133, sceAppUtilResetCookieWebBrowser
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x53b2c020, sceAppUtilAddcontMount
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x6a140498, sceAppUtilDrmClose
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x6bed9b58, sceAppUtilAppEventParseNpAppDataMessage
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x7402c6ea, sceAppUtilPspSaveDataLoad
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x77380601, sceAppUtilAppEventParseNearGift
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x85fa94ee, sceAppUtilStoreBrowse
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x8dee696b, sceAppUtilAppEventParseTriggerUtil
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x8ed716f5, sceAppUtilAppEventParseWebBrowser
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x96f478d6, sceAppUtilBgdlGetStatus
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x9942071d, sceAppUtilPspSaveDataGetDirNameList
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0x9d8ac677, sceAppUtilSaveSafeMemory
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0xa2496814, sceAppUtilAppEventParseNpInviteMessage
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0xc560e716, sceAppUtilSaveDataGetQuota
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0xc97d5d9e, sceAppUtilAddCookieWebBrowser
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0xcd7fd67a, sceAppUtilAppParamGetInt
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0xd1c6ab8e, sceAppUtilSaveDataDataRemove
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0xe6057a85, sceAppUtilSaveDataSlotSearch
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0xe61453b0, sceAppUtilSaveDataMount
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0xeb720402, sceAppUtilSaveDataUmount
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0xee0dbed9, sceAppUtilReceiveAppEvent
PSP2_IMPORT_FUNC SceAppUtil, 0001, F00, 0xf19d0423, sceAppUtilLaunchWebBrowser
**/

#endif
