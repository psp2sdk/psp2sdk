# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x094a4902 0x4d6436f9 0xb845bccb 0xb94abf83
)

set(SRCS
    SceMd5_stub.S
)

add_psp2_stub(SceMd5 ${SRCS} ${NIDS})
