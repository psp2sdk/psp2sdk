# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

PREFIX = _SceNpScore-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x00f90e7b 0x0433069f 0x15981858 0x2050f98f 	\
	0x24b09634 0x31733bf3 0x320c0277 0x3cd9974e 	\
	0x40573917 0x427d3412 0x45cd1d00 0x53d77883 	\
	0x5685f225 0x5ef44841 0x6fd2041a 0x7c68d91b 	\
	0x871f28aa 0x9f2a7ac9 0xa0c94d46 0xa7e93ce1 	\
	0xaa0bbf8e 0xbae55b34 0xc2862b67 0xc45e3fcd 	\
	0xce3a9544 0xce416993 0xd30d1993 0xdfad64d3 	\
	0xf52ea88a 0xfff24bb1

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceNpScore_stub.a
libSceNpScore_stub_a_SOURCES = SceNpScore_stub.S
am_libSceNpScore_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceNpScore_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceNpScore_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceNpScore_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@
