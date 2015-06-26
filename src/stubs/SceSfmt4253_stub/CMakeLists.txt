# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x01683cdd 0x59a1b9fc 0x6c0e5e3c 0x8791e2ef
    0xc4d7aa2d 0xe9f8cb9a
)

set(SRCS
    SceSfmt4253_stub.S
)

add_psp2_stub(SceSfmt4253 ${SRCS} ${NIDS})
