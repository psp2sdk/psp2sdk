# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x0d941b90 0x13ad2218 0x480564c9 0x5570b83e
    0x6078a08b 0x74724147 0x789d867c 0x851fb144
    0xa9db29f6 0xb3875104 0xbab8eccb 0xc3367370
    0xc750d3da 0xdf4c665a 0xe0577765 0xf0db1ae5
    0xfd5a6504
)

set(SRCS
    SceSystemGesture_stub.S
)

add_psp2_stub(SceSystemGesture ${SRCS} ${NIDS})
