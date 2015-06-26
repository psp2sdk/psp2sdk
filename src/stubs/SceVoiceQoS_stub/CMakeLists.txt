# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x2d613549 0x2fe1f28f 0x3c7a08b0 0x4b5fff1c
    0x540ceba5 0x68fabf6f 0x876a9b9c 0xaab54be4
    0xbab98727 0xc2f2c771 0xc981ab3b 0xc9dc1425
    0xe0c5ceee 0xe5b4527d 0xe757806f 0xe81b8d44
    0xfb0b747b
)

set(SRCS
    SceVoiceQoS_stub.S
)

add_psp2_stub(SceVoiceQoS ${SRCS} ${NIDS})
