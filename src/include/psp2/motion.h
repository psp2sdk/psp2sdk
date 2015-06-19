/**
 * \file
 * \brief Header file which defines motion variables and functions
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

#ifndef _PSP2_MOTION_
#define _PSP2_MOTION_

#include <psp2/types.h>

/* struct */

typedef struct SceMotionState {
	unsigned int timestamp;
	SceFVector3 acceleration;
	SceFVector3 angularVelocity;
	unsigned char reserve1[12];
	SceFQuaternion deviceQuat;
	SceUMatrix4 rotationMatrix;
	SceUMatrix4 nedMatrix;
	unsigned char reserve2[4];
	SceFVector3 basicOrientation;
	SceULong64 hostTimestamp;
	unsigned char reserve3[40];
} SceMotionState;

typedef struct SceMotionSensorState {
	SceFVector3 accelerometer;
	SceFVector3 gyro;
	unsigned char reserve1[12];
	unsigned int timestamp;
	unsigned int counter;
	unsigned char reserve2[4];
	SceULong64 hostTimestamp;
	unsigned char reserve3[8];
} SceMotionSensorState;

/* prototypes */

int sceMotionGetState(SceMotionState *motionState);
int sceMotionGetSensorState(SceMotionSensorState *sensorState, int numRecords);
int sceMotionGetBasicOrientation(SceFVector3 *basicOrientation);
int sceMotionRotateYaw(const float radians);
int sceMotionGetTiltCorrection();
int sceMotionSetTiltCorrection(int setValue);
int sceMotionGetDeadband();
int sceMotionSetDeadband(int setValue);
int sceMotionSetAngleThreshold(const float angle);
float sceMotionGetAngleThreshold();
int sceMotionReset();
int sceMotionMagnetometerOn();
int sceMotionMagnetometerOff();
int sceMotionGetMagnetometerState();
int sceMotionStartSampling();
int sceMotionStopSampling();

#endif
