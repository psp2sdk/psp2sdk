# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x0560d9a1 0x324c76f0 0x420c30e9 0x9f99adf7
    0xb304962c 0xb6132502 0xf524ad2b 0xfb200a6d
)

set(SRCS
    SceNpPartyGameUtil_stub.S
)

add_psp2_stub(SceNpParty ${SRCS} ${NIDS})
