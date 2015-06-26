# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x2ff42588 0x569bf903 0x81b67ab5 0x8e25cba8
    0xc297e6b1 0xf7ffe87c
)

set(SRCS
    SceSfmt86243_stub.S
)

add_psp2_stub(SceSfmt86243 ${SRCS} ${NIDS})
