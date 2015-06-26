# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x03ce6e3a 0x2a857867 0x3c733316 0x412711e5
    0x70dea174 0x901c5c15 0x95e14ca6 0x9b2f1bc1
    0xbd203262 0xc73687e4 0xf5ed7b68
)

set(SRCS
    SceSsl_stub.S
)

add_psp2_stub(SceSsl ${SRCS} ${NIDS})
