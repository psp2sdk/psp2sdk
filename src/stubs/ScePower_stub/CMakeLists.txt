# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x04b7766e 0x1e490401 0x2085d15d 0x3ce187b6
    0x78a1a796 0x87440f5e 0x8efb3fa2 0x94f5a53f
    0xd3075926 0xdfa8baf8 0xfd18a0ff
)

set(SRCS
    ScePower_stub.S
)

add_psp2_stub(ScePower ${SRCS} ${NIDS})
