# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x452246d0 0x552e8882 0x64c04ae8 0x76ee4dc6
    0x9386f42d 0x9b1e8de2 0xab32d022 0xc6ba5ee6
    0xd01c63a3 0xd85db29c 0xead4af38
)

set(SRCS
    SceAudioencUser_stub.S
)

add_psp2_stub(SceAudioenc ${SRCS} ${NIDS})
