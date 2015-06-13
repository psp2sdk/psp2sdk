/**
 * \file
 * \brief Header file which defines display related variables and functions
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
 
#ifndef _PSP2_DISPLAY_H_
#define _PSP2_DISPLAY_H_

#include <psp2/types.h>


enum DisplayErrorCodes {
	SCE_DISPLAY_ERROR_OK					= 0,
	SCE_DISPLAY_ERROR_INVALID_HEAD			= 0x80290000,
	SCE_DISPLAY_ERROR_INVALID_VALUE			= 0x80290001,
	SCE_DISPLAY_ERROR_INVALID_ADDR			= 0x80290002,
	SCE_DISPLAY_ERROR_INVALID_PIXELFORMAT	= 0x80290003,
	SCE_DISPLAY_ERROR_INVALID_PITCH			= 0x80290004,
	SCE_DISPLAY_ERROR_INVALID_RESOLUTION	= 0x80290005,
	SCE_DISPLAY_ERROR_INVALID_UPDATETIMING	= 0x80290006,
	SCE_DISPLAY_ERROR_NO_FRAME_BUFFER		= 0x80290007,
	SCE_DISPLAY_ERROR_NO_PIXEL_DATA			= 0x80290008
};

#define PSP2_DISPLAY_PIXELFORMAT_A8B8G8R8 0x00000000U

enum DisplaySetBufSync {
	/** Buffer change effective immediately */
	PSP2_DISPLAY_SETBUF_IMMEDIATE = 0,
	/** Buffer change effective next frame */
	PSP2_DISPLAY_SETBUF_NEXTFRAME = 1
};

/***
 * Structure used with sceDisplaySetFrameBuf to set/update framebuffer.
 * Original screen resolution is 960x544, but the following resolutions 
 * can also be supplied as width and height :
 * 480x272, 640x368, 720x408
 *
 * @note - This structure is returned by sceDisplayGetFrameBuf
*/
typedef struct SceDisplayFrameBuf {
	unsigned int size; 			//!< sizeof(SceDisplayFrameBuf)
	void *base; 				//!< Pointer to framebuffer 
	unsigned int pitch;			//!< pitch pixels
	unsigned int pixelformat; 	//!< use PSP2_DISPLAY_PIXELFORMAT_A8B8G8R8
	unsigned int width; 		//!< framebuffer width
	unsigned int height; 		//!< framebuffer height
} SceDisplayFrameBuf;

/***
 * Set/Update framebuffer parameters
 *
 * @param[in] pParam - Pointer to a ::SceDisplayFrameBuf structure.
 * @param[in] sync - One of ::DisplaySetBufSync
 *
 * @return 0 on success, < 0 on error.
 * @note - If NULL is provided as pParam pointer, output is blacked out.
*/
int sceDisplaySetFrameBuf(const SceDisplayFrameBuf *pParam, int sync);

/***
 * Get current framebuffer parameters
 *
 * @param[out] pParam - Pointer to a ::SceDisplayFrameBuf structure
 * which will receive framebuffer parameters.
 *
 * @param[in] sync - One of ::DisplaySetBufSync
 *
 * @return 0 on success, < 0 on error.
*/
int sceDisplayGetFrameBuf(SceDisplayFrameBuf *pParam, int sync);

/***
 * Get current number of fps for the current screen mode.
 *
 * @param[out] pFps - Pointer to a float variable to store current number of fps.
 *
 * @return 0 on success, < 0 on error.
 * @note - This function returns a theoretical value, this might not be the exact frame rate.
*/
int sceDisplayGetRefreshRate(float *pFps);

/**
 * Number of vertical blank pulses up to now
 */
int sceDisplayGetVcount(void);

/**
 * Wait for vertical blank start
 */
int sceDisplayWaitVblankStart(void);

/**
 * Wait for vertical blank start with callback
 */
int sceDisplayWaitVblankStartCB(void);

/**
 * Wait for vertical blank start after specified number of vertical periods
 * 
 * @param[in] vcount - Number of vertical periods before waiting for vertical blank start
 */
int sceDisplayWaitVblankStartMulti(unsigned int vcount);

/**
 * Wait for vertical blank start with callback after specified number of vertical periods
 * 
 * @param[in] vcount - Number of vertical periods before waiting for vertical blank start
 */
int sceDisplayWaitVblankStartMultiCB(unsigned int vcount);

/**
 * Wait for vertical blank start since last update of framebuffer
 */
int sceDisplayWaitSetFrameBuf(void);

/**
 * Wait for vertical blank start with callback since last update of framebuffer
 */
int sceDisplayWaitSetFrameBufCB(void);

/**
 * Wait for vertical blank start after specified number of vertical periods 
 * since last update of framebuffer.
 * 
 * @param[in] vcount - Number of vertical periods before waiting for vertical blank start
 */
int sceDisplayWaitSetFrameBufMulti(unsigned int vcount);

/**
 * Wait for vertical blank start with callback after specified number of vertical periods
 * since last update of framebuffer.
 * 
 * @param[in] vcount - Number of vertical periods before waiting for vertical blank start
 */
int sceDisplayWaitSetFrameBufMultiCB(unsigned int vcount);

/**
 * Register callback to be used at each vertical blank start
 *
 * @param[in] uid - Callback UID
 */
int sceDisplayRegisterVblankStartCallback(SceUID uid);

/**
 * Unregister callback used at each vertical blank start
 *
 * @param[in] uid - Callback UID
 */
int sceDisplayUnregisterVblankStartCallback(SceUID uid);


#endif /* _PSP2DISPLAY_H_ */
