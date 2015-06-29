# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

PREFIX = _SceNpCommerce2-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x021dc797 0x0550c016 0x118e1c5e 0x123e55f4 	\
	0x18bdc4bd 0x24d3fe34 0x29186e27 0x315b9bd0 	\
	0x363922ba 0x3b7c81a5 0x4dfbcdd6 0x5135ea31 	\
	0x56b80faf 0x586b0599 0x5cf665e0 0x6cd27bd0 	\
	0x7132eaa5 0x774f88d0 0x7894dcdf 0x84c336c6 	\
	0x84e56a6d 0x88d236df 0x9cd463f8 0xa308b496 	\
	0xa4464754 0xadf3bd5b 0xaee8d3df 0xb0aff6c9 	\
	0xb88db7c2 0xb99958ae 0xba5a5784 0xbbddf866 	\
	0xc47cdb59 0xc594adc2 0xc73f209a 0xd6a5b200 	\
	0xde45f84f 0xe7486a60 0xe81b8bad 0xf6f23623 	\
	0xfdb39774 0xffc8b18b

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceNpCommerce2_stub.a
libSceNpCommerce2_stub_a_SOURCES = SceNpCommerce2_stub.S
am_libSceNpCommerce2_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceNpCommerce2_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceNpCommerce2_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceNpCommerce2_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@
