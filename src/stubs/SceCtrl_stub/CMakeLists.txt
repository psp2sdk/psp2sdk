# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x104ed1a7 0x15f96fb0 0x67e7ab83 0xa497b150
    0xa9c3ced6 0xd8294c9c 0xe9cb69c8 0xec752aaf
)

set(SRCS
    SceCtrl_stub.S
)

add_psp2_stub(SceCtrl ${SRCS} ${NIDS})
