@ Copyright (C) 2015 PSP2SDK Project
@
@ This library is free software: you can redistribute it and/or modify
@ it under the terms of the GNU Lesser General Public License as published by
@ the Free Software Foundation, either version 3 of the License, or
@ (at your option) any later version.
@
@ This libary is distributed in the hope that it will be useful,
@ but WITHOUT ANY WARRANTY; without even the implied warranty of
@ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
@ GNU Lesser General Public License for more details.
@
@ You should have received a copy of the GNU Lesser General Public License
@ along with this program.  If not, see <http://www.gnu.org/licenses/>.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceFiber, 0001, 1, 0

PSP2_IMPORT_FUNC SceFiber, 0001, F00, 0x189599b4, sceFiberGetInfo
PSP2_IMPORT_FUNC SceFiber, 0001, F00, 0x3b42921f, sceFiberReturnToThread
PSP2_IMPORT_FUNC SceFiber, 0001, F00, 0x414d8ca5, sceFiberGetSelf
PSP2_IMPORT_FUNC SceFiber, 0001, F00, 0x4ec01f9c, sceFiberPopUserMarkerWithHud
PSP2_IMPORT_FUNC SceFiber, 0001, F00, 0x67f70867, sceFiberStopContextSizeCheck
PSP2_IMPORT_FUNC SceFiber, 0001, F00, 0x7d0c7ddb, _sceFiberAttachContextAndRun
PSP2_IMPORT_FUNC SceFiber, 0001, F00, 0x7df23243, sceFiberRun
PSP2_IMPORT_FUNC SceFiber, 0001, F00, 0x801ab334, sceFiberOptParamInitialize
PSP2_IMPORT_FUNC SceFiber, 0001, F00, 0x9c414b09, sceFiberPushUserMarkerWithHud
PSP2_IMPORT_FUNC SceFiber, 0001, F00, 0xc6a3f9bb, _sceFiberInitializeWithInternalOptionImpl
PSP2_IMPORT_FUNC SceFiber, 0001, F00, 0xcd543a71, sceFiberStartContextSizeCheck
PSP2_IMPORT_FUNC SceFiber, 0001, F00, 0xe00b9afe, _sceFiberAttachContextAndSwitch
PSP2_IMPORT_FUNC SceFiber, 0001, F00, 0xe160f844, sceFiberFinalize
PSP2_IMPORT_FUNC SceFiber, 0001, F00, 0xe4283144, sceFiberSwitch
PSP2_IMPORT_FUNC SceFiber, 0001, F00, 0xf24a298c, _sceFiberInitializeImpl
