# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x1346d270 0x538f04ce 0xa36ecf65 0xb5fd0160
)

set(SRCS
    SceSha224_stub.S
)

add_psp2_stub(SceSha224 ${SRCS} ${NIDS})
