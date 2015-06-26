# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x087b0535 0x1b8c3192 0x34516838 0x4ebc6977
    0x56f5cba5 0x94bab8d0 0xa4addd91 0xb397aa24
    0xba2b7f2a 0xbfe0f28f 0xc49fd33f 0xc8d2a4de
    0xd55c6f4c 0xfe382529 0xff142071
)

set(SRCS
    SceNpTrophy_stub.S
)

add_psp2_stub(SceNpTrophy ${SRCS} ${NIDS})
