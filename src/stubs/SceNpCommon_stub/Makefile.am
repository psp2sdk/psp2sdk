# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

PREFIX = _SceNpCommon-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x14fc18af 0x3377cd37 0x441d8b4e 0x59608d1c 	\
	0x6093b689 0x6bc8150a 0x8327c26f 0xc1e23e01 	\
	0xc8e51cca 0xe2582575 0xe807d0bc 0xe9a003de 	\
	0xed42079f 0xf93842f0 0xfb8d82e5

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceNpCommon_stub.a
libSceNpCommon_stub_a_SOURCES = SceNpCommon_stub.S
am_libSceNpCommon_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceNpCommon_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceNpCommon_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceNpCommon_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@
