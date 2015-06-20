# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

PREFIX = _SceCommonDialog-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x013e7f74 0x0150a451 0x032206d8 0x043a353e 	\
	0x04b63d6f 0x07ed1e26 0x0cc66115 0x147650e8 	\
	0x19192c8b 0x1e7043bf 0x1fd5d373 0x2192a10a 	\
	0x2339fbd5 0x2702905b 0x2a0d060f 0x2b02be3f 	\
	0x2d8edf09 0x2eb3d046 0x36c5e9a5 0x39467634 	\
	0x4107019e 0x415d6068 0x4458b053 0x44b9e931 	\
	0x4535a358 0x47ab6d04 0x4a40c37f 0x4a880c6a 	\
	0x4b125581 0x52ecd8a5 0x58fa2062 0x594a220e 	\
	0x5c322d1e 0x5e0afdf8 0x5f7f4149 0x61c45e12 	\
	0x6821f09b 0x6c49924b 0x6e258046 0x6e572ebf 	\
	0x7004bb2e 0x73ee7c9c 0x749caffc 0x74ff2a8b 	\
	0x755ff270 0x7ab50f63 0x7b339aa2 0x7be0e08b 	\
	0x7e22ad33 0x7ec95c61 0x7fe5bd77 0x8027292a 	\
	0x81acf695 0x838a3af4 0x86ae7314 0x87f3f43e 	\
	0x8852b9a4 0x8acc1f0b 0x8be51c15 0x8e35ea7b 	\
	0x8ed0c83c 0x90530f2f 0x93e51b04 0x93fcfec6 	\
	0x9bebb77b 0x9cda5e0d 0x9e2c02c9 0xa38a4a0d 	\
	0xa81082dd 0xa8682304 0xb05fce9e 0xb2ff576e 	\
	0xb5ed4a32 0xb787f4b0 0xb8e37f7c 0xba0542ca 	\
	0xbb3bfc89 0xbde00a83 0xbecd35c8 0xbf5248fa 	\
	0xc296d396 0xc3a59547 0xc700b2df 0xcd990375 	\
	0xcf0431fd 0xd29fe607 0xd4c37375 0xd5a6b473 	\
	0xd6387e24 0xd699d9b4 0xd855414c 0xdc346979 	\
	0xddc52a46 0xde1f3928 0xe37069d5 0xe525bdb0 	\
	0xf4f600ca 0xfdfe6042 0xffa35858

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceCommonDialog_stub.a
libSceCommonDialog_stub_a_SOURCES = SceCommonDialog_stub.S
am_libSceCommonDialog_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceCommonDialog_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceCommonDialog_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceCommonDialog_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@
