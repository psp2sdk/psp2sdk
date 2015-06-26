# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x05db59c7 0x50ae9ff9 0x7061665b 0x76e674d1
    0x816633fe 0xbae9e534 0xd509fb08 0xda80a228
)

set(SRCS
    SceScreenShot_stub.S
)

add_psp2_stub(SceScreenShot ${SRCS} ${NIDS})
