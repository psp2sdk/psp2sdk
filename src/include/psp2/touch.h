/**
 * \file
 * \brief Header file which defines touch related variables and functions
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

#ifndef _PSP2_TOUCH_H_
#define _PSP2_TOUCH_H_

#include <psp2/types.h>
#include <stdint.h>

enum {
	SCE_TOUCH_ERROR_INVALID_ARG	= 0x80350001,
	SCE_TOUCH_ERROR_PRIV_REQUIRED	= 0x80350002,
	SCE_TOUCH_ERROR_FATAL	= 0x803500ff
};

typedef struct SceTouchPanelInfo {
	int16_t minAaX;	//!< Min active area X position
	int16_t minAaY;	//!< Min active area Y position
	int16_t maxAaX;	//!< Max active area X position
	int16_t maxAaY;	//!< Max active area Y position
	int16_t minDispX;	//!< Min display X position
	int16_t minDispY;	//!< Min display Y position
	int16_t maxDispX;	//!< Max display X position
	int16_t maxDispY;	//!< Max display Y position
	uint8_t minForce;	//!< Min touch force value
	uint8_t maxForce;	//!< Max touch force value
	uint8_t reserved[30];	//!< Reserved
} SceTouchPanelInfo;

typedef struct SceTouchReport {
	uint8_t id;	//!< Touch ID
	uint8_t force;	//!< Touch force
	int16_t x;	//!< X position
	int16_t y;	//!< Y position
	uint8_t reserved[8];	//!< Reserved
	uint16_t info;	//!< Information of this touch
} SceTouchReport;

typedef struct SceTouchData {
	uint64_t timeStamp;	//!< Data timestamp
	unsigned int status;	//!< Unused
	unsigned int reportNum;	//!< Number of touch reports
	SceTouchReport report[8];	//!< Touch reports
} SceTouchData;

enum {
	PSP2_TOUCH_PORT_FRONT,	//!< Front touch panel id
	PSP2_TOUCH_PORT_BACK,	//!< Back touch panel id

	PSP2_TOUCH_PORT_MAX_NUM	//!< Number of touch panels
};

#define PSP2_TOUCH_MAX_REPORT 6	//!< ???? 6 on front | 4 on back
#define PSP2_TOUCH_SAMPLING_STATE_START -1	//!< not found
#define PSP2_TOUCH_SAMPLING_STATE_STOP -1	//!< not found

/**
 * Get Touch Panel information
 *
 * @param[in]	port	Port number.
 * @param[out]	pPanelInfo	The buffer to get the Touch Panel information.
 */
int sceTouchGetPanelInfo(unsigned int port, SceTouchPanelInfo *pPanelInfo);

/**
 * Get touch data (Blocking)
 *
 * @param[in]	port	Port Number.
 * @param[out]	pData	Buffer to receive touch data.
 */
int sceTouchRead(unsigned int port, SceTouchData *pData, uint32_t nBufs);

/**
 * Set sampling state of touch panel.
 *
 * @param[in]	port	Port number.
 * @param[in]	state	Sampling state.
 */
int sceTouchSetSamplingState(unsigned int port, unsigned int state);

/**
 * Get sampling state of touch panel.
 *
 * @param[in]	port	Port number.
 * @param[out]	pState	The buffer to receive sampling state.
 */
int sceTouchGetSamplingState(unsigned int port, unsigned int *pState);

/**
 * Disable touch force output.
 *
 * @param[in]	port	Port number.
 */

int sceTouchDisableTouchForce(unsigned int port);

/**
 * Enable touch force output.
 *
 * @param[in]	port	Port number.
 */

int sceTouchEnableTouchForce(unsigned int port);

/***
 * Get touch data (Polling)
 *
 * @param[in]	port	port number.
 * @param[out]	pData	Buffer to receive touch data.
 * @param[in]	nBufs	Number of buffers to receive touch data.
 */
int sceTouchPeek(unsigned int port, SceTouchData *pData, unsigned int nBufs);

#endif
