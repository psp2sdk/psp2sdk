# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

PREFIX = _SceNpBasic-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x050ae072 0x1211ae8e 0x20146aec 0x26e6e048 	\
	0x2a764628 0x364531a8 0x3700e00c 0x389bcb3b 	\
	0x3b0a7f47 0x407e1e6f 0x5183a4b5 0x51d75562 	\
	0x7a5020a5 0x863249cb 0x8c90cc09 0x91bf63cb 	\
	0x9a9e2021 0xb9041420 0xd20c2370 0xdf41f308 	\
	0xe02a445c 0xef8a91bc 0xefb91a99 0xf51545d8 	\
	0xfb0f7fdf 0xfe98e45a 0xff07e787

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceNpBasic_stub.a
libSceNpBasic_stub_a_SOURCES = SceNpBasic_stub.S
am_libSceNpBasic_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceNpBasic_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceNpBasic_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceNpBasic_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@
