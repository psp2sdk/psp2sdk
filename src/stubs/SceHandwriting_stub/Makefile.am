# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

PREFIX = _SceHandwriting-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x09af9bf8 0x12e4f99a 0x356b2931 0x446f171e 	\
	0x4c3a8d49 0x69324689 0x6abbd675 0x6ba4a521 	\
	0x76395d93 0x79ca5d3f 0xb886450e

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceHandwriting_stub.a
libSceHandwriting_stub_a_SOURCES = SceHandwriting_stub.S
am_libSceHandwriting_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceHandwriting_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceHandwriting_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceHandwriting_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@
