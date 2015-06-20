@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceClipboard, 0001, 1, 0

PSP2_IMPORT_FUNC SceClipboard, 0001, F00, 0x43a94d3e, sceClipboardSetText
PSP2_IMPORT_FUNC SceClipboard, 0001, F00, 0x5bb10cc2, sceClipboardGetText
