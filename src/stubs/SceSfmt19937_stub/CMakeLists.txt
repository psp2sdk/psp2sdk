# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x2afacb0b 0xa1c654d8 0xac496c8c 0xe66f2502
    0xe74ba81c 0xf0557157
)

set(SRCS
    SceSfmt19937_stub.S
)

add_psp2_stub(SceSfmt19937 ${SRCS} ${NIDS})
