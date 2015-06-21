@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceHeap, 0001, 1, 0

PSP2_IMPORT_FUNC SceHeap, 0001, F00, 0x00be8fc3, sceHeapReallocHeapMemoryWithOption
PSP2_IMPORT_FUNC SceHeap, 0001, F00, 0x76c5b003, sceHeapGetTotalFreeSize
PSP2_IMPORT_FUNC SceHeap, 0001, F00, 0x9e6716ba, sceHeapReallocHeapMemory
PSP2_IMPORT_FUNC SceHeap, 0001, F00, 0xa130d00c, sceHeapDeleteHeap
PSP2_IMPORT_FUNC SceHeap, 0001, F00, 0xa7571ad8, sceHeapCreateHeap
PSP2_IMPORT_FUNC SceHeap, 0001, F00, 0xaa50462f, sceHeapIsAllocatedHeapMemory
PSP2_IMPORT_FUNC SceHeap, 0001, F00, 0xad2645b0, sceHeapGetMallinfo
PSP2_IMPORT_FUNC SceHeap, 0001, F00, 0xb6fc0ba1, sceHeapAllocHeapMemory
PSP2_IMPORT_FUNC SceHeap, 0001, F00, 0xd09ffc11, sceHeapFreeHeapMemory
PSP2_IMPORT_FUNC SceHeap, 0001, F00, 0xd4c09869, sceHeapAllocHeapMemoryWithOption
