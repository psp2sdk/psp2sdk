# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x277da915 0x46d2f044 0x82de9bf8
)

set(SRCS
    SceLibLocationExtension_stub.S
)

add_psp2_stub(SceLocationExtension ${SRCS} ${NIDS})
