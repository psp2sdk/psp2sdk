@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceIme, 0001, 1, 0

PSP2_IMPORT_FUNC SceIme, 0001, F00, 0x0e050613, sceImeOpen
PSP2_IMPORT_FUNC SceIme, 0001, F00, 0x71d6898a, sceImeUpdate
PSP2_IMPORT_FUNC SceIme, 0001, F00, 0x7b1efaa5, sceImeSetPreeditGeometry
PSP2_IMPORT_FUNC SceIme, 0001, F00, 0x889a8421, sceImeClose
PSP2_IMPORT_FUNC SceIme, 0001, F00, 0xd8342d2a, sceImeSetCaret
PSP2_IMPORT_FUNC SceIme, 0001, F00, 0xf3bd9a76, sceImeSetText
