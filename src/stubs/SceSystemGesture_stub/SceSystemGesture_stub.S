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

PSP2_IMPORT_HEAD 0x0, SceSystemGesture, 0001, 1, 0

PSP2_IMPORT_FUNC SceSystemGesture, 0001, F00, 0x0d941b90, sceSystemGestureResetTouchRecognizer
PSP2_IMPORT_FUNC SceSystemGesture, 0001, F00, 0x13ad2218, sceSystemGestureGetTouchEventsCount
PSP2_IMPORT_FUNC SceSystemGesture, 0001, F00, 0x480564c9, sceSystemGestureGetPrimitiveTouchEventByPrimitiveID
PSP2_IMPORT_FUNC SceSystemGesture, 0001, F00, 0x5570b83e, sceSystemGestureGetTouchEventByEventID
PSP2_IMPORT_FUNC SceSystemGesture, 0001, F00, 0x6078a08b, sceSystemGestureInitializePrimitiveTouchRecognizer
PSP2_IMPORT_FUNC SceSystemGesture, 0001, F00, 0x74724147, sceSystemGestureGetTouchEventByIndex
PSP2_IMPORT_FUNC SceSystemGesture, 0001, F00, 0x789d867c, sceSystemGestureGetTouchEvents
PSP2_IMPORT_FUNC SceSystemGesture, 0001, F00, 0x851fb144, sceSystemGestureUpdateTouchRecognizer
PSP2_IMPORT_FUNC SceSystemGesture, 0001, F00, 0xa9db29f6, sceSystemGestureUpdateTouchRecognizerRectangle
PSP2_IMPORT_FUNC SceSystemGesture, 0001, F00, 0xb3875104, sceSystemGestureFinalizePrimitiveTouchRecognizer
PSP2_IMPORT_FUNC SceSystemGesture, 0001, F00, 0xbab8eccb, sceSystemGestureGetPrimitiveTouchEventsCount
PSP2_IMPORT_FUNC SceSystemGesture, 0001, F00, 0xc3367370, sceSystemGestureCreateTouchRecognizer
PSP2_IMPORT_FUNC SceSystemGesture, 0001, F00, 0xc750d3da, sceSystemGestureGetPrimitiveTouchEvents
PSP2_IMPORT_FUNC SceSystemGesture, 0001, F00, 0xdf4c665a, sceSystemGestureUpdatePrimitiveTouchRecognizer
PSP2_IMPORT_FUNC SceSystemGesture, 0001, F00, 0xe0577765, sceSystemGestureGetPrimitiveTouchEventByIndex
PSP2_IMPORT_FUNC SceSystemGesture, 0001, F00, 0xf0db1ae5, sceSystemGestureGetTouchRecognizerInformation
PSP2_IMPORT_FUNC SceSystemGesture, 0001, F00, 0xfd5a6504, sceSystemGestureResetPrimitiveTouchRecognizer
