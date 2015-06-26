# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x16d8aa5e 0x1c38322a 0x908f1122 0xcf1c8c38
    0xd411a9a6 0xf869dfdc
)

set(SRCS
    SceSfmt44497_stub.S
)

add_psp2_stub(SceSfmt44497 ${SRCS} ${NIDS})
