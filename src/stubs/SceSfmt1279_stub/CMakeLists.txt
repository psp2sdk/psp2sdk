# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x02e8d906 0x9b4a48df 0xa2c5ee14 0xc25d9ace
    0xdb3832eb 0xe7f63838
)

set(SRCS
    SceSfmt1279_stub.S
)

add_psp2_stub(SceSfmt1279 ${SRCS} ${NIDS})
