# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x00e52720 0x66425db6 0x79065bb2 0xc5359df8
)

set(SRCS
    SceSha512t_stub.S
)

add_psp2_stub(SceSha512t ${SRCS} ${NIDS})
