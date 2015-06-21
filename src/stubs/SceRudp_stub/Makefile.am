# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

PREFIX = _SceRudp-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x104e4d3b 0x18668bd8 0x22c9aa29 0x24e36e39 	\
	0x2c1e736e 0x30a9438e 0x396a24d6 0x3a495e69 	\
	0x3ea0961e 0x46b635bd 0x4dc43692 0x552b2d3e 	\
	0x55918c7c 0x5d0460cd 0x68a52861 0x69c9de15 	\
	0x6b74ca22 0x772c07e8 0x8b766108 0x8d45ba52 	\
	0x943d96ec 0xa9b92efe 0xade196dc 0xbd87a5ca 	\
	0xc9acbdf0 0xd620b557 0xd77928c5 0xe1dd9645 	\
	0xe68005e3 0xf1151d91

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceRudp_stub.a
libSceRudp_stub_a_SOURCES = SceLibRudp_stub.S
am_libSceRudp_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceRudp_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceRudp_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceRudp_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@
