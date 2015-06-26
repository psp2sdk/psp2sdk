# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x14116007 0x2f401247 0x3c616238 0x48d879ba
)

set(SRCS
    SceGameUpdate_stub.S
)

add_psp2_stub(SceGameUpdate ${SRCS} ${NIDS})
