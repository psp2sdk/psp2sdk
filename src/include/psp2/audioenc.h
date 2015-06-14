/**
 * \file
 * \brief Header file which defines output audio related variables and functions
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

#ifndef _PSP2_AUDIOENC_H_
#define _PSP2_AUDIOENC_H_

#include <psp2/types.h>

enum AudioencErrorCodes {
	SCE_AUDIOENC_ERROR_API_FAIL	= 0x80860000,
	SCE_AUDIOENC_ERROR_INVALID_TYPE	= 0x80860001,
	SCE_AUDIOENC_ERROR_INVALID_INIT_PARAM	= 0x80860002,
	SCE_AUDIOENC_ERROR_ALREADY_INITIALIZED	= 0x80860003,
	SCE_AUDIOENC_ERROR_OUT_OF_MEMORY	= 0x80860004,
	SCE_AUDIOENC_ERROR_NOT_INITIALIZED	= 0x80860005,
	SCE_AUDIOENC_ERROR_A_HANDLE_IN_USE	= 0x80860006,
	SCE_AUDIOENC_ERROR_ALL_HANDLES_IN_USE	= 0x80860007,
	SCE_AUDIOENC_ERROR_INVALID_PTR	= 0x80860008,
	SCE_AUDIOENC_ERROR_INVALID_HANDLE	= 0x80860009,
	SCE_AUDIOENC_ERROR_NOT_HANDLE_IN_USE	= 0x8086000A,
	SCE_AUDIOENC_ERROR_CH_SHORTAGE	= 0x8086000B,
	SCE_AUDIOENC_ERROR_INVALID_WORD_LENGTH	= 0x8086000C,
	SCE_AUDIOENC_ERROR_INVALID_SIZE	= 0x8086000D,
	SCE_AUDIOENC_ERROR_INVALID_ALIGNMENT	= 0x8086000E
};

enum AudioencCelpErrorCodes {
	SCE_AUDIOENC_CELP_ERROR_INVALID_CONFIG	= 0x80861001,
};

#define SCE_AUDIOENC_WORD_LENGTH_16BITS	(16)	//!< Definition of wordlength

#define SCE_AUDIOENC_TYPE_CELP	(0x2006U)	//!< Audio encoder type

#define SCE_AUDIOENC_CELP_MAX_STREAMS	(1)	//!< Max number of streams
#define SCE_AUDIOENC_CELP_MAX_SAMPLES	(320)	//!< Max number of samples
#define SCE_AUDIOENC_CELP_MAX_ES_SIZE	(24)	//!< Max elementary stream size

#define SCE_AUDIOENC_CELP_MPE	(0)	//!< CELP encoder default excitation mode

#define SCE_AUDIOENC_CELP_SAMPLING_RATE_8KHZ	(8000)	//!< CELP encoder default sampling rate

#define SCE_AUDIOENC_CELP_BIT_RATE_3850BPS	(3850)	//!< 3850 bps
#define SCE_AUDIOENC_CELP_BIT_RATE_4650BPS	(4650)	//!< 4650 bps
#define SCE_AUDIOENC_CELP_BIT_RATE_5700BPS	(5700)	//!< 5700 bps
#define SCE_AUDIOENC_CELP_BIT_RATE_7300BPS	(7300)	//!< 7300 bps

typedef struct SceAudioencInitStreamParam {
	int	size;	//!< Size of this structure
	int	totalStreams;	//!< Total number of audio streams
};

/* Info for CELP */
typedef struct SceAudioencInfoCelp {
	int	size;	//!< Size of this structure
	int	excitationMode;	//!< Excitation mode
	int	samplingRate; //!< Sampling rate
	int	bitRate;	//!< Bit rate
};

/* Optional info for CELP */
typedef struct SceAudioencOptInfoCelp {
	int	size;	//!< Size of this structure
	int	header[32];	//!< Header buffer
	int	headerSize;	//!< Header size
	int	encoderVersion;	//!< Encoder version
};

typedef union SceAudioencInitParam {
	int size;	//!< Size of this structure
	SceAudioencInitStreamParam	celp;
};

/* Audio encoder info */
typedef union SceAudioencInfo {
	int	size;	//!< Size of this structure
	SceAudioencInfoCelp	celp;
};

/* Audio encoder optional info */
typedef union SceAudioencOptInfo {
	int	size;	//!< Size of this structure
	SceAudioencOptInfoCelp	celp;
};

typedef struct SceAudioencCtrl {
	int	size;	//!< Size of this structure
	int	handle;	//!< Encoder handle
	int	*pInputPcm;	//!< Pointer to elementary stream
	int	inputPcmSize;	//!< Size of elementary stream used actually (in byte)
	int	maxPcmSize;	//!< Max size of elementary stream used (in byte)
	void	*pOutputEs;	//!< Pointer to PCM
	int	outputEsSize;	//!< Size of PCM output actually (in byte)
	int	maxEsSize;	//!< Max size of PCM output (in byte)
	int	wordLength;	//!< PCM bit depth
	SceAudioencInfo	*pInfo;	//!< Pointer to SceAudioencInfo
	SceAudioencOptInfo	*pOptInfo;	//!< Pointer to SceAudioencOptInfo
};

extern int sceAudioencInitLibrary(int codecType, SceAudioencInitParam *pInitParam);
extern int sceAudioencTermLibrary(SceUInt32 codecType);
extern int sceAudioencCreateEncoder(SceAudioencCtrl *pCtrl, int codecType);
extern int sceAudioencDeleteEncoder(SceAudioencCtrl *pCtrl);
extern int sceAudioencEncode(SceAudioencCtrl *pCtrl);
extern int sceAudioencClearContext(SceAudioencCtrl *pCtrl);
extern int sceAudioencGetOptInfo(SceAudioencCtrl *pCtrl);
extern int sceAudioencGetInternalError(SceAudioencCtrl *pCtrl, int *pInternalError);

#endif
