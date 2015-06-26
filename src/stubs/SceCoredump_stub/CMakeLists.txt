# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x031dc61e 0x6037a2c3 0xdf335dcf
)

set(SRCS
    SceCoredump_stub.S
    SceCoredumpNounlink_stub.S
)

add_psp2_stub(SceCoredump ${SRCS} ${NIDS})
