# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

DISPLAY_PREFIX = _SceDisplay-0001_
DISPLAY_ENTRIES_PREFIX = $(DISPLAY_PREFIX)F00_

DISPLAYUSER_PREFIX = _SceDisplayUser-0001_
DISPLAYUSER_ENTRIES_PREFIX = $(DISPLAYUSER_PREFIX)F00_

DISPLAY_NIDS = 0x05f27764 0x3e796ef5 0x5795e898 0x6bdf4c4d	\
	0x78b41b92 0x7d9864a8 0x814c90af 0x9423560c	\
	0x98436a80 0xa08ca60d 0xb6fde0ba 0xdd0a13b8

DISPLAYUSER_NIDS = 0x42ae6bbc 0x7a410b64

DISPLAY_ENTRIES = $(addsuffix .o,$(addprefix $(DISPLAY_ENTRIES_PREFIX),$(subst 0x,,$(DISPLAY_NIDS))))
DISPLAYUSER_ENTRIES = $(addsuffix .o,$(addprefix $(DISPLAYUSER_ENTRIES_PREFIX),$(subst 0x,,$(DISPLAYUSER_NIDS))))

lib_LIBRARIES = libSceDisplay_stub.a
libSceDisplay_stub_a_SOURCES = SceDisplay_stub.S SceDisplayUser_stub.S
am_libSceDisplay_stub_a_OBJECTS =	\
	$(DISPLAY_PREFIX)head.o $(DISPLAYUSER_PREFIX)head.o	\
	$(DISPLAY_PREFIX)NIDS.o $(DISPLAYUSER_PREFIX)NIDS.o	\
	$(DISPLAY_ENTRIES) $(DISPLAYUSER_ENTRIES)

$(DISPLAY_PREFIX)head.o: SceDisplay_stub.S
	$(AM_V_CC)$(COMPILE) -DHEAD $< -c -o $@

$(DISPLAY_PREFIX)NIDS.o: SceDisplay_stub.S
	$(AM_V_CC)$(COMPILE) -DNIDS $< -c -o $@

$(DISPLAY_ENTRIES): SceDisplay_stub.S
	$(AM_V_CC)$(COMPILE) -DFUNC=$(subst $(DISPLAY_ENTRIES_PREFIX),0x,$*) $< -c -o $@

$(DISPLAYUSER_PREFIX)head.o: SceDisplayUser_stub.S
	$(AM_V_CC)$(COMPILE) -DHEAD $< -c -o $@

$(DISPLAYUSER_PREFIX)NIDS.o: SceDisplayUser_stub.S
	$(AM_V_CC)$(COMPILE) -DNIDS $< -c -o $@

$(DISPLAYUSER_ENTRIES): SceDisplayUser_stub.S
	$(AM_V_CC)$(COMPILE) -DFUNC=$(subst $(DISPLAYUSER_ENTRIES_PREFIX),0x,$*) $< -c -o $@
