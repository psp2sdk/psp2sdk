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

#ifndef _PSP2_APPMGR_H_
#define _PSP2_APPMGR_H_

#include <psp2/types.h>

enum {
	//! Busy
	SCE_APPMGR_ERROR_BUSY	= 0x80802000,

	//! Invalid state
	SCE_APPMGR_ERROR_STATE	= 0x80802013,

	//! NULL pointer
	SCE_APPMGR_ERROR_NULL_POINTER	= 0x80802016,

	//!< Invalid param
	SCE_APPMGR_ERROR_INVALID	= 0x8080201a,

	//!< Invalid self path
	SCE_APPMGR_ERROR_INVALID_SELF_PATH	= 0x8080201e,

	//!< argv is too long
	SCE_APPMGR_ERROR_TOO_LONG_ARGV	= 0x8080201d
};

enum {
	SCE_APPMGR_SYSTEMEVENT_ON_RESUME	= 0x10000003,
	SCE_APPMGR_SYSTEMEVENT_ON_STORE_PURCHASE	= 0x10000004,
	SCE_APPMGR_SYSTEMEVENT_ON_NP_MESSAGE_ARRIVED	= 0x10000005,
	SCE_APPMGR_SYSTEMEVENT_ON_STORE_REDEMPTION	= 0x10000006,
};

enum {
	SCE_APPMGR_INFOBAR_VISIBILITY_INVISIBLE	= 0,
	SCE_APPMGR_INFOBAR_VISIBILITY_VISIBLE	= 1
};

enum {
	SCE_APPMGR_INFOBAR_COLOR_BLACK	= 0,
	SCE_APPMGR_INFOBAR_COLOR_WHITE	= 1
};

enum {
	SCE_APPMGR_INFOBAR_TRANSPARENCY_OPAQUE	= 0,
	SCE_APPMGR_INFOBAR_TRANSPARENCY_TRANSLUCENT	= 1
};

typedef struct SceAppMgrSystemEvent {
	int systemEvent;
	uint8_t reserved[60];
};

#define SCE_APPMGR_MAX_APP_NAME_LENGTH	(31)

int _sceAppMgrGetAppState(SceAppMgrAppState *appState, uint32_t len, uint32_t version);

/**
 * static __inline int sceAppMgrGetAppState(SceAppMgrAppState *appState) {
 *	 return _sceAppMgrGetAppState(appState, sizeof(SceAppMgrAppState), version);
 * };
 */

int sceAppMgrRecieveSystemEvent(SceAppMgrSystemEvent *systemEvent);

//! Obtains the BGM port, even when it is not in front
int sceAppMgrAcquireBgmPort(void);

//! Release acquired BGM port
int sceAppMgrReleaseBgmPort(void);

//! Set infobar state
int sceAppMgrSetInfobarState(int visibility, int color, int transparency);

typedef struct sceAppMgrLoadExecOptParam {
	int reserved[256 / 4];
};

int sceAppMgrLoadExec(const char *appPath, char * const argv[],
	const SceAppMgrExecOptParam *optParam);

#endif
