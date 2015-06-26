# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x17c10e2d 0x3cc47146 0x84bb4adb 0xab3ad459
    0xb8e5a0bb 0xbb89d8f0
)

set(SRCS
    SceSfmt2281_stub.S
)

add_psp2_stub(SceSfmt2281 ${SRCS} ${NIDS})
