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

#ifndef _PSP2_MOTION_H_
#define _PSP2_MOTION_H_

#include <psp2/types.h>
#include <stdint.h>

/* struct */

typedef struct SceMotionState {
	unsigned int timestamp;
	SceFVector3 acceleration;
	SceFVector3 angularVelocity;
	uint8_t reserved1[12];
	SceFQuaternion deviceQuat;
	SceUMatrix4 rotationMatrix;
	SceUMatrix4 nedMatrix;
	uint32_t reserved2;
	SceFVector3 basicOrientation;
	SceULong64 hostTimestamp;
	uint8_t reserved[40];
} SceMotionState;

typedef struct SceMotionSensorState {
	SceFVector3 accelerometer;
	SceFVector3 gyro;
	uint8_t reserved1[12];
	unsigned int timestamp;
	unsigned int counter;
	uint32_t reserved2;
	SceULong64 hostTimestamp;
	uint8_t reserved3[8];
} SceMotionSensorState;

/* prototypes */

int sceMotionGetState(SceMotionState *motionState);
int sceMotionGetSensorState(SceMotionSensorState *sensorState, int numRecords);
int sceMotionGetBasicOrientation(SceFVector3 *basicOrientation);
int sceMotionRotateYaw(float radians);
int sceMotionGetTiltCorrection(void);
int sceMotionSetTiltCorrection(int setValue);
int sceMotionGetDeadband(void);
int sceMotionSetDeadband(int setValue);
int sceMotionSetAngleThreshold(float angle);
float sceMotionGetAngleThreshold(void);
int sceMotionReset(void);
int sceMotionMagnetometerOn(void);
int sceMotionMagnetometerOff(void);
int sceMotionGetMagnetometerState(void);
int sceMotionStartSampling(void);
int sceMotionStopSampling(void);

#endif
