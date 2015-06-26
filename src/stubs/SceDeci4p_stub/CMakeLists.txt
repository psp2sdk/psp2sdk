# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x28578fe8 0x3bc66bd8 0x5a4cdf97 0x63b0c50f
    0x73371f35 0x971e1c66 0xc4e1d86d 0xcda3aaac
)

set(SRCS
    SceDeci4pUserp_stub.S
)

add_psp2_stub(SceDeci4p ${SRCS} ${NIDS})
