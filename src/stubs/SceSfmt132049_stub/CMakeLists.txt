# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x68ad7866 0x795f9644 0xbbd80ac4 0xd891a99f
    0xdc69294a 0xdc6b23b0
)

set(SRCS
    SceSfmt132049_stub.S
)

add_psp2_stub(SceSfmt132049 ${SRCS} ${NIDS})
