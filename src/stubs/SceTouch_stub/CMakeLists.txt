# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x10a2ca25 0x169a1d58 0x1b9c5d14 0x26531526
    0x41194411 0xb18370c2 0xff082df0
)

set(SRCS
    SceTouch_stub.S
)

add_psp2_stub(SceTouch ${SRCS} ${NIDS})
