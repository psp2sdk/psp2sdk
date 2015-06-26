# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x29e43bb5 0xee5ba27c
)

set(SRCS
    SceMt19937_stub.S
)

add_psp2_stub(SceMt19937 ${SRCS} ${NIDS})
