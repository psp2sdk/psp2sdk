/**
 * \file
 * \brief Header file which defines font (PGF) variables and functions
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

#ifndef _PSP2_PGF_
#define _PSP2_PGF_

#include <psp2/types.h>

/* typedef */

typedef SceUID SceFontLibHandle;
typedef SceUID SceFontHandle;

/* struct */

enum {
	SCE_FONT_ERROR_OUT_OF_MEMORY        = 0x80460001,
	SCE_FONT_ERROR_INVALID_LIBID        = 0x80460002,
	SCE_FONT_ERROR_INVALID_PARAMETER    = 0x80460003,
	SCE_FONT_ERROR_HANDLER_OPEN_FAILED  = 0x80460005,
	SCE_FONT_ERROR_TOO_MANY_OPEN_FONTS  = 0x80460009,
	SCE_FONT_ERROR_INVALID_FONT_DATA    = 0x8046000a,
};

typedef struct SceSceFontNewLibParams {
	unsigned int *userDataAddr;
	unsigned int numFonts;
	unsigned int *cacheDataAddr;

	// Driver callbacks.
	void *(*allocFuncAddr)(void *, unsigned int);
	void  (*freeFuncAddr )(void *, void *);
	unsigned int *openFuncAddr;
	unsigned int *closeFuncAddr;
	unsigned int *readFuncAddr;
	unsigned int *seekFuncAddr;
	unsigned int *errorFuncAddr;
	unsigned int *ioFinishFuncAddr;
} SceFontNewLibParams;

typedef enum FontFamily {
	FONT_FAMILY_SANS_SERIF = 1,
	FONT_FAMILY_SERIF      = 2,
} FontFamily;

typedef enum FontStyle {
	FONT_STYLE_REGULAR     = 1,
	FONT_STYLE_ITALIC      = 2,
	FONT_STYLE_BOLD        = 5,
	FONT_STYLE_BOLD_ITALIC = 6,
	FONT_STYLE_DB          = 103, // Demi-Bold / semi-bold
} FontStyle;

typedef enum FontLanguage {
	FONT_LANGUAGE_JAPANESE = 1,
	FONT_LANGUAGE_LATIN    = 2,
	FONT_LANGUAGE_KOREAN   = 3,
	FONT_LANGUAGE_CHINESE  = 4,
}FontLanguage;

typedef enum FontPixelFormat {
	FONT_PIXELFORMAT_4     = 0, // 2 pixels packed in 1 byte (natural order)
	FONT_PIXELFORMAT_4_REV = 1, // 2 pixels packed in 1 byte (reversed order)
	FONT_PIXELFORMAT_8     = 2, // 1 pixel in 1 byte
	FONT_PIXELFORMAT_24    = 3, // 1 pixel in 3 bytes (RGB)
	FONT_PIXELFORMAT_32    = 4, // 1 pixel in 4 bytes (RGBA)
} FontPixelFormat;

typedef struct SceFontImageRect {
	short width;
	short height;
} SceFontImageRect;

typedef struct SceFontGlyphImage {
	FontPixelFormat pixelFormat;
	int xPos64;
	int yPos64;
	unsigned short bufWidth;
	unsigned short bufHeight;
	unsigned short bytesPerLine;
	unsigned short pad;
	unsigned int bufferPtr;
} SceFontGlyphImage;

typedef struct SceFontStyle {
	float  fontH;
	float  fontV;
	float  fontHRes;
	float  fontVRes;
	float  fontWeight;
	u16    fontFamily;
	u16    fontStyle;
	// Check.
	u16    fontStyleSub;
	u16    fontLanguage;
	u16    fontRegion;
	u16    fontCountry;
	char   fontName[64];
	char   fontFileName[64];
	unsigned int    fontAttributes;
	unsigned int    fontExpire;
} SceFontStyle;

typedef struct SceFontCharInfo {
	unsigned int bitmapWidth;
	unsigned int bitmapHeight;
	unsigned int bitmapLeft;
	unsigned int bitmapTop;
	// Glyph metrics (in 26.6 signed fixed-point).
	unsigned int sfp26Width;
	unsigned int sfp26Height;
	int sfp26Ascender;
	int sfp26Descender;
	int sfp26BearingHX;
	int sfp26BearingHY;
	int sfp26BearingVX;
	int sfp26BearingVY;
	int sfp26AdvanceH;
	int sfp26AdvanceV;
	short shadowFlags;
	short shadowId;
} SceFontCharInfo;

typedef struct SceFontInfo {
	// Glyph metrics (in 26.6 signed fixed-point).
	unsigned int maxGlyphWidthI;
	unsigned int maxGlyphHeightI;
	unsigned int maxGlyphAscenderI;
	unsigned int maxGlyphDescenderI;
	unsigned int maxGlyphLeftXI;
	unsigned int maxGlyphBaseYI;
	unsigned int minGlyphCenterXI;
	unsigned int maxGlyphTopYI;
	unsigned int maxGlyphAdvanceXI;
	unsigned int maxGlyphAdvanceYI;

	// Glyph metrics (replicated as float).
	float maxGlyphWidthF;
	float maxGlyphHeightF;
	float maxGlyphAscenderF;
	float maxGlyphDescenderF;
	float maxGlyphLeftXF;
	float maxGlyphBaseYF;
	float minGlyphCenterXF;
	float maxGlyphTopYF;
	float maxGlyphAdvanceXF;
	float maxGlyphAdvanceYF;

	// Bitmap dimensions.
	short maxGlyphWidth;
	short maxGlyphHeight;
	unsigned int  charMapLength;   // Number of elements in the font's charmap.
	unsigned int  shadowMapLength; // Number of elements in the font's shadow charmap.

	// Font style (used by font comparison functions).
	SceFontStyle fontStyle;

	u8 BPP; // Font's BPP.
	u8 pad[3];
} SceFontInfo;

/* prototypes */

SceFontLibHandle sceFontNewLib(SceFontNewLibParams *params, unsigned int *errorCode);
int sceFontDoneLib(SceFontLibHandle libHandle);

SceFontHandle sceFontOpen(SceFontLibHandle libHandle, int index, int mode, unsigned int *errorCode);
SceFontHandle sceFontOpenUserMemory(SceFontLibHandle libHandle, void *memoryFontAddr, int memoryFontLength, unsigned int *errorCode);
SceFontHandle sceFontOpenUserFile(SceFontLibHandle libHandle, char *fileName, int mode, unsigned int *errorCode);
int sceFontClose(SceFontHandle fontHandle);

int sceFontGetNumFontList(SceFontLibHandle libHandle, unsigned int *errorCode);
int sceFontFindOptimumFont(SceFontLibHandle libHandle, SceFontStyle *fontStyle, unsigned int *errorCode);
int sceFontFindFont(SceFontLibHandle libHandle, SceFontStyle *fontStyle, unsigned int *errorCode);
int sceFontGetFontInfo(SceFontHandle fontHandle, SceFontInfo *fontInfo);
int sceFontGetFontInfoByIndexNumber(SceFontLibHandle libHandle, SceFontStyle *fontStyle, int unknown, int fontIndex);

int sceFontSetResolution(SceFontLibHandle libHandle, float hRes, float vRes);

int sceFontGetFontList(SceFontLibHandle libHandle, SceFontStyle *fontStyle, int numFonts);
int sceFontGetCharInfo(SceFontHandle fontHandle, u32 charCode, SceFontCharInfo *charInfo);
int sceFontGetCharImageRect(SceFontHandle fontHandle, u32 charCode, SceFontImageRect *charRect);
int sceFontGetCharGlyphImage(SceFontHandle fontHandle, u32 charCode, SceFontGlyphImage *glyphImage);
int sceFontGetCharGlyphImage_Clip(SceFontHandle fontHandle, u32 charCode, SceFontGlyphImage *glyphImage, int clipXPos, int clipYPos, int clipWidth, int clipHeight);

float sceFontPixelToPointH(SceFontLibHandle libHandle, float fontPixelsH, unsigned int *errorCode);
float sceFontPixelToPointV(SceFontLibHandle libHandle, float fontPixelsV, unsigned int *errorCode);
float sceFontPointToPixelH(SceFontLibHandle libHandle, float fontPointsH, unsigned int *errorCode);
float sceFontPointToPixelV(SceFontLibHandle libHandle, float fontPointsV, unsigned int *errorCode);

int sceFontSetAltCharacterCode(SceFontLibHandle libHandle, u32 charCode);

int sceFontFlush(SceFontHandle fontHandle);

#endif
