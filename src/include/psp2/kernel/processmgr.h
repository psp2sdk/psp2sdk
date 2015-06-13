/**
 * \file
 * \brief Header file which defines processes related variables and functions
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
 
#ifndef _PSP2_KERNEL_PROCESSMGR_H_
#define _PSP2_KERNEL_PROCESSMGR_H_

#include <psp2/types.h>

enum KernelProcessPrioritySystem {
	PSP2_KERNEL_PROCESS_PRIORITY_SYSTEM_HIGH	= 32,
	PSP2_KERNEL_PROCESS_PRIORITY_SYSTEM_DEFAULT	= 96,
	PSP2_KERNEL_PROCESS_PRIORITY_SYSTEM_LOW		= 159
};

enum KernelProcessPriorityUser {
	PSP2_KERNEL_PROCESS_PRIORITY_USER_HIGH		= 64,
	PSP2_KERNEL_PROCESS_PRIORITY_USER_DEFAULT	= 96,
	PSP2_KERNEL_PROCESS_PRIORITY_USER_LOW		= 127
};

enum KernelPowerTickType {
	/** Cancel all timers */
	PSP2_KERNEL_POWER_TICK_DEFAULT				= 0,
	/** Cancel automatic suspension timer */
	PSP2_KERNEL_POWER_TICK_DISABLE_AUTO_SUSPEND	= 1,
	/** Cancel OLED-off timer */
	PSP2_KERNEL_POWER_TICK_DISABLE_OLED_OFF		= 4,
	/** Cancel OLED dimming timer */
	PSP2_KERNEL_POWER_TICK_DISABLE_OLED_DIMMING	= 6
};

typedef union _SceKernelSysClock {
	struct	{
		unsigned int low; //!< Same as ::sceKernelGetProcessTimeLow
		unsigned int hi;
	} u;
	SceUInt64 quad;
} SceKernelSysClock;

/***
 * Exit current Process with specified return code
 *
 * @param[in] res - Exit code to return
 *
 * @return 0 on success, < 0 on error.
 * @note - If NULL is provided as FrameBuf pointer, output is blacked out.
*/
int sceKernelExitProcess(int res);

/***
 * Cancel specified idle timers to prevent entering in power save processing.
 *
 * @param[in] type - One of ::KernelPowerTickType
 *
 * @return 0
*/
int sceKernelPowerTick(int type);

/***
 * Get the process time of the current process.
 *
 * @param[out] type - Pointer to a ::SceKernelSysClock structure which will receive the process time.
 *
 * @return 0 on success, < 0 on error.
*/
int sceKernelGetProcessTime(SceKernelSysClock *pSysClock);

/***
 * Get the lower 32 bits part of process time of the current process.
 *
 * @return process time of the current process
*/
SceUInt32 sceKernelGetProcessTimeLow(void);

/***
 * Get the process time of the current process.
 *
 * @return process time of the current process
*/
SceUInt64 sceKernelGetProcessTimeWide(void);

#endif /* _PSP2PROCESSMGR_H_ */
