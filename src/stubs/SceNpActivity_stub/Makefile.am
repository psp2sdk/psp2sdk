# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

PREFIX = _SceNpActivity-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x9ea4901f 0xbc7fdc77 0xe0ffee97

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceNpActivity_stub.a
libSceNpActivity_stub_a_SOURCES = SceNpActivity_stub.S
am_libSceNpActivity_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceNpActivity_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceNpActivity_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceNpActivity_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@
