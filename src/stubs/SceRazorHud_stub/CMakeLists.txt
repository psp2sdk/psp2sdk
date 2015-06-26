# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x29cefdaa 0x528aa4c7 0x6dfbac39 0x6fd64de6
    0x73f83357 0x77f2f606 0x7a51f1a0 0xb46382fc
    0xbcb790e9 0xbd360a69 0xbfeadb77 0xcc390860
    0xdfd00bae 0xe3709b44 0xece363ef 0xf867efe1
    0xfd290a17
)

set(SRCS
    SceRazorHud_stub.S
)

add_psp2_stub(SceRazorHud ${SRCS} ${NIDS})
