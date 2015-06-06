@ Copyright (C) 2015 PSP2SDK Project
@
@ This library is free software; you can redistribute it and/or
@ modify it under the terms of the GNU Lesser General Public
@ License version 2.1 as published by the Free Software Foundation
@
@ This library is distributed in the hope that it will be useful,
@ but WITHOUT ANY WARRANTY; without even the implied warranty of
@ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
@ Lesser General Public License for more details.
@
@ You should have received a copy of the GNU Lesser General Public
@ License along with this library; if not, write to the Free Software
@ Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

#include <psp2import.S>

PSP2_IMPORT_HEAD 0x0, SceFace, 0001, 1, 0

PSP2_IMPORT_FUNC SceFace, 0001, F00, 0x17f3dc79, sceFaceAgeRangeEstimate
PSP2_IMPORT_FUNC SceFace, 0001, F00, 0x37704de9, sceFaceShapeTrack
PSP2_IMPORT_FUNC SceFace, 0001, F00, 0x4468b054, sceFaceIdentifyGetWorkingMemorySize
PSP2_IMPORT_FUNC SceFace, 0001, F00, 0x64f45021, sceFaceShapeFit
PSP2_IMPORT_FUNC SceFace, 0001, F00, 0x67f0585a, sceFaceAttribute
PSP2_IMPORT_FUNC SceFace, 0001, F00, 0x707b9a1d, sceFacePartsGetWorkingMemorySize
PSP2_IMPORT_FUNC SceFace, 0001, F00, 0x70c9cf95, sceFacePartsEx
PSP2_IMPORT_FUNC SceFace, 0001, F00, 0x73e9791d, sceFaceAgeGetWorkingMemorySize
PSP2_IMPORT_FUNC SceFace, 0001, F00, 0x7d71725d, sceFaceDetectionLocal
PSP2_IMPORT_FUNC SceFace, 0001, F00, 0x87550392, sceFaceParts
PSP2_IMPORT_FUNC SceFace, 0001, F00, 0x8f8e9fb1, sceFaceIdentifySimilarity
PSP2_IMPORT_FUNC SceFace, 0001, F00, 0xa905a467, sceFaceAttributeGetWorkingMemorySize
PSP2_IMPORT_FUNC SceFace, 0001, F00, 0xb794c6cb, sceFaceAgeRangeIntegrate
PSP2_IMPORT_FUNC SceFace, 0001, F00, 0xc0812127, sceFaceShapeGetWorkingMemorySize
PSP2_IMPORT_FUNC SceFace, 0001, F00, 0xcc98b939, sceFacePartsResultCheck
PSP2_IMPORT_FUNC SceFace, 0001, F00, 0xcf07e1c4, sceFaceAllPartsGetWorkingMemorySize
PSP2_IMPORT_FUNC SceFace, 0001, F00, 0xe521eb6f, sceFaceAllParts
PSP2_IMPORT_FUNC SceFace, 0001, F00, 0xf24b851d, sceFaceDetectionGetWorkingMemorySize
PSP2_IMPORT_FUNC SceFace, 0001, F00, 0xf3045394, sceFaceDetection
PSP2_IMPORT_FUNC SceFace, 0001, F00, 0xf7e4ec1f, sceFaceEstimatePoseRegion
PSP2_IMPORT_FUNC SceFace, 0001, F00, 0xf852e35d, sceFaceIdentifyGetFeature
