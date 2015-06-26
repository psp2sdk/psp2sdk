# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x123b4734 0x2a769bd8 0x353ba9b0 0x4598ec9c
    0x518163a7 0x6215b095 0x6263aec2 0x62842598
    0xb030773b 0xc2380e3a 0xde8d5fa1
)

set(SRCS
    SceJpegUser_stub.S
)

add_psp2_stub(SceJpeg ${SRCS} ${NIDS})
