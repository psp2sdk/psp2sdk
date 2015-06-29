# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

PREFIX = _SceNetCtl-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x0961a561 0x495ca1db 0x4ddd6149 0x4fb4bea1 	\
	0x6b20ec02 0x6d26ac68 0x7118c99d 0x77586c59 	\
	0x7ae0ed19 0xa4471e10 0xb26d07f3 0xcd188648 	\
	0xd0c3bf3f 0xda130450 0xdffc3ed4 0xeaee6185 	\
	0xed43b79a 0xffa9d594

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceNetCtl_stub.a
libSceNetCtl_stub_a_SOURCES = SceNetCtl_stub.S
am_libSceNetCtl_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceNetCtl_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceNetCtl_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceNetCtl_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@
