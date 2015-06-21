@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceSfmt11213, 0001, 1, 0

PSP2_IMPORT_FUNC SceSfmt11213, 0001, F00, 0x7a412a29, sceSfmt11213FillArray64
PSP2_IMPORT_FUNC SceSfmt11213, 0001, F00, 0x8ff464c9, sceSfmt11213InitGenRand
PSP2_IMPORT_FUNC SceSfmt11213, 0001, F00, 0xafedd6e1, sceSfmt11213GenRand64
PSP2_IMPORT_FUNC SceSfmt11213, 0001, F00, 0xbaf5f058, sceSfmt11213InitByArray
PSP2_IMPORT_FUNC SceSfmt11213, 0001, F00, 0xfb281cd7, sceSfmt11213GenRand32
PSP2_IMPORT_FUNC SceSfmt11213, 0001, F00, 0xfd696585, sceSfmt11213FillArray32
