# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x1520d408 0x5e880862 0x76a5d8ca 0x8a0bf859
    0xa288adb9 0xcc6daba0

)

set(SRCS
    SceSfmt607_stub.S
)

add_psp2_stub(SceSfmt607 ${SRCS} ${NIDS})
