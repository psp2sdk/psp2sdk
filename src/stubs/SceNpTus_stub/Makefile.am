# Copyright (C) 2015 PSP2SDK Project
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License version 2.1 as published by the Free Software Foundation
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

PREFIX = _SceNpTus-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x0374c127 0x0a5d05f1 0x0cfac523 0x1989cc51 	\
	0x1c8d73a8 0x246db508 0x2c5f1162 0x2e9a7fd0 	\
	0x33e29819 0x3907a8bc 0x3b44d0e4 0x4099fc56 	\
	0x41fbed79 0x420350f9 0x44947d07 0x50fc680f 	\
	0x518a64b9 0x520975c3 0x5eb05c7a 0x6a175f75 	\
	0x6b2a54eb 0x7593d595 0x7a101394 0x7edc33b3 	\
	0x883ac44a 0x88a2d551 0x8972df8f 0x8ca469f4 	\
	0x9677bdd6 0x987d1018 0x99dc7420 0x9a1e4472 	\
	0x9ba9148c 0x9e8e1cf8 0x9faba1e5 0xa3f00ee6 	\
	0xa61aedb0 0xaf7148a6 0xb0a6f839 0xb2141f8d 	\
	0xb46b5d7f 0xbb5e5e29 0xbbefcd26 0xc003c588 	\
	0xc08a1e5e 0xc4bb64a7 0xc5656132 0xccb9e791 	\
	0xd26b9f4c 0xd51b39ed 0xd53d3692 0xd62d2a0b 	\
	0xd8d5caba 0xd97e51ec 0xe1d6d4cf 0xea588f23 	\
	0xf1d9529e 0xf4d40b19 0xf6d24df7 0xf91887ec 	\
	0xfc0c5159 0xfc300e7e 0xfe92d6cb 

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceNpTus_stub.a
libSceNpTus_stub_a_SOURCES = SceNpTus_stub.S 
am_libSceNpTus_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceNpTus_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceNpTus_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceNpTus_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@