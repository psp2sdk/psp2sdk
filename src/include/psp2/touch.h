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

#ifndef _PSP2TOUCH_H_
#define _PSP2TOUCH_H_

#include <psp2/types.h>


enum TouchErrorCodes {
  SCE_TOUCH_ERROR_INVALID_ARG			= 0x80350001,
  SCE_TOUCH_ERROR_PRIV_REQUIRED			= 0x80350002,
  SCE_TOUCH_ERROR_FATAL			= 0x803500ff
};

typedef struct SceTouchPanelInfo {
  short minAaX;	//!< Min active area X position
  short minAaY;	//!< Min active area Y position
  short maxAaX;	//!< Max active area X position
  short maxAaY;	//!< Max active area Y position
  short minDispX;	//!< Min display X position
  short minDispY;	//!< Min display Y position
  short maxDispX;	//!< Max display X position
  short maxDispY;	//!< Max display Y position
  unsigned char minForce;	//!< Min touch force value
  unsigned char maxForce;	//!< Max touch force value
  unsigned char rsv[30];	//!< Reserved
} SceTouchPanelInfo;

typedef struct SceTouchReport {
  unsigned char id;	//!< Touch ID
  unsigned char force;	//!< Touch force
  short x;	//!< X position
  short y;	//!< Y position
  char rsv[8];	//!< Reserved
  unsigned short info;	//!< Information of this touch
} SceTouchReport;

typedef struct SceTouchData {
  unsigned long timeStamp;	//!< Data timestamp
  unsigned int status;	//!< Unused
  unsigned int reportNum;	//!< Number of touch reports
  SceTouchReport report[8];	//!< Touch reports
} SceTouchData;

#define PSP2_TOUCH_PORT_FRONT 0x0	//!< Front touch panel id
#define PSP2_TOUCH_PORT_BACK 0x1	//!< Back touch panel id
#define PSP2_TOUCH_PORT_MAX_NUM 2	//!< Number of touch panels
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
int sceTouchRead(unsigned int port, SceTouchData *pData, unsigned int nBufs);

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

#endif /* _PSP2TOUCH_H_ */
