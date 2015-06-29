# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

PREFIX = _SceMotion-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x047f060a 0x0fd2cda2 0x112e0eae 0x122a79f8 	\
	0x20f00078 0x28034ac9 0x3d4813ae 0x47d679ea 	\
	0x499b6c87 0x4f28bfe0 0x917ea390 0xa4a7e6e2 	\
	0xaf09fcdb 0xaf32cb1d 0xbdb32767 0xc1652201 	\
	0xc1a7395a 0xdacb2a41 0xe8a28da5

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceMotion_stub.a
libSceMotion_stub_a_SOURCES = SceMotion_stub.S
am_libSceMotion_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceMotion_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceMotion_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceMotion_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@
