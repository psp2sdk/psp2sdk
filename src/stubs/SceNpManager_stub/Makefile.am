# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

PREFIX = _SceNpManager-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x04d9f484 0x19e40ae1 0x3b0ae9a9 0x3c94b4b4 	\
	0x43dc48a1 0x44239c35 0x54060df6 0x60c575b1 	\
	0xaf0073b2 0xd9e6e56c 0xfe835967

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceNpManager_stub.a
libSceNpManager_stub_a_SOURCES = SceNpManager_stub.S
am_libSceNpManager_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceNpManager_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceNpManager_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceNpManager_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@
