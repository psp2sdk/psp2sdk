# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

PREFIX = _SceCodecEnginePerf-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x0635eb77 0x2c9da711 0x5d75df62 0xd2efaea1

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceCodecEnginePerf_stub.a
libSceCodecEnginePerf_stub_a_SOURCES = SceCodecEnginePerf_stub.S
am_libSceCodecEnginePerf_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceCodecEnginePerf_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceCodecEnginePerf_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceCodecEnginePerf_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@
