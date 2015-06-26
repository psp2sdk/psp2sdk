# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x06807ca3 0x146be236 0x2364d6bd 0x2ed36ee2
    0x2f35c196 0x360d4a19 0x3f3f6d92 0x4cce6a14
    0x52021026 0x6c2e610f 0x773abea9 0x80d6c552
    0x88a68d20 0x8cbeb2da 0x8f3cc01c 0xa64d9d38
    0xad264f5f 0xaef3022a 0xb14145dd 0xb22cb01d
    0xbbca5813 0xd393578e 0xdb8bac35 0xde6f0859
    0xe75a5a9b 0xefe6f060 0xf3398774 0xf8c15008
    0xff3bc581
)

set(SRCS
    SceNearUtil_stub.S
)

add_psp2_stub(SceNearUtil ${SRCS} ${NIDS})
