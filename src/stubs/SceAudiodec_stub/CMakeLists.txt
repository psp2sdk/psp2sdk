# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x445c2cef 0x45719b9d 0x4dfd3aaa 0x56085dfb
    0x68f4a9cb 0x8018aa9b 0x883b0cf5 0xccdaba04
    0xdb712abc 0xe4ea05bb 0xe7a24e16 0xf72f9b64
)

set(SRCS
    SceAudiodecUser_stub.S
)

add_psp2_stub(SceAudiodec ${SRCS} ${NIDS})
