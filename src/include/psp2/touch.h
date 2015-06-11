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

typedef struct SceTouchPanelInfo
{
  short minAaX;
  short minAaY;
  short maxAaX;
  short maxAaY;
  short minDispX;
  short minDispY;
  short maxDispX;
  short maxDispY;
  unsigned char minForce;
  unsigned char maxForce;
  unsigned char rsv[30];
} SceTouchPanelInfo;

typedef struct SceTouchReport
{
  unsigned char id;
  unsigned char force;
  short x;
  short y;
  char rsv[8];
  unsigned short info;
} SceTouchReport;

typedef struct SceTouchData
{
  unsigned long timeStamp;
  unsigned int status;
  unsigned int reportNum;
	SceTouchReport report[8];
} SceTouchData;

#define PSP2_TOUCH_PORT_FRONT 0x0		//!< Front touch panel id
#define PSP2_TOUCH_PORT_BACK 0x1		//!< Back touch panel id
#define PSP2_TOUCH_PORT_MAX_NUM 2   //!< Number of touch panels
#define PSP2_TOUCH_MAX_REPORT 6 //!< ???? 6 on front | 4 on back
#define PSP2_TOUCH_SAMPLING_STATE_START -1	//!< not found
#define PSP2_TOUCH_SAMPLING_STATE_STOP -1 //!< not found

int sceTouchGetPanelInfo(unsigned int port, SceTouchPanelInfo *pPanelInfo);

int sceTouchRead(unsigned int port, SceTouchData *pData, unsigned int nBufs);

int sceTouchSetSamplingState(unsigned int port, unsigned int state);

int sceTouchGetSamplingState(unsigned int port, unsigned int *pState);

int sceTouchSetSamplingState(unsigned int port, unsigned int state);

int sceTouchGetSamplingState(unsigned int port, unsigned int *pState);

int sceTouchDisableTouchForce(unsigned int port);

int sceTouchEnableTouchForce(unsigned int port);

int sceTouchPeek(unsigned int port, SceTouchData *pData, unsigned int nBufs);


#endif /* _PSP2TOUCH_H_ */
