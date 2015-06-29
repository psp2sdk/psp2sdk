# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

PREFIX = _ScePvf-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x10452b86 0x17a7873b 0x2761feac 0x35465bd7 	\
	0x37da496a 0x3dd09bc9 0x58142d71 0x64e0ea8b 	\
	0x66f2d767 0x687ff765 0x6c1b9caf 0x6e787722 	\
	0x72e58672 0x830625c2 0x8ae8433a 0x91f02f9a 	\
	0x984e5bfe 0x997161c3 0x9cbc1a46 0x9e65e4ed 	\
	0x9f018f25 0xa55f973f 0xa81570eb 0xa88eedb0 	\
	0xab0c7cf2 0xb6ce89e1 0xb8d01915 0xbc90f661 	\
	0xc4444fb3 0xcda282d2 0xd282c23c 0xd535520f 	\
	0xdfb677c5 0xe17717ec 0xe35434bb 0xe676a888 	\
	0xeccb0cee 0xeedab884 0xf17ade4d 0xf3e1e8bd 	\
	0xf56b5b9b 0xf6c4a855 0xfeee373a

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libScePvf_stub.a
libScePvf_stub_a_SOURCES = ScePvf_stub.S
am_libScePvf_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libScePvf_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libScePvf_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libScePvf_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@
