# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

PREFIX = _SceGameUpdate-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x14116007 0x2f401247 0x3c616238 0x48d879ba

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceGameUpdate_stub.a
libSceGameUpdate_stub_a_SOURCES = SceGameUpdate_stub.S
am_libSceGameUpdate_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceGameUpdate_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceGameUpdate_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceGameUpdate_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@
