# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x0e050613 0x71d6898a 0x7b1efaa5 0x889a8421
    0xd8342d2a 0xf3bd9a76
)

set(SRCS
    SceIme_stub.S
)

add_psp2_stub(SceIme ${SRCS} ${NIDS})
