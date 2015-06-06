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

PREFIX = _SceNpUtility-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x0158b61b 0x027587c4 0x081fa13c 0x282bd43c 	\
	0x32b068c4 0x33b64699 0x5110e17e 0x5387babb 	\
	0x58d92efd 0x6a1bf429 0x8b608bf6 0x9246a673 	\
	0x9e42e922 0xb0c9dc45 0xb1a14879 0xcf956f23 	\
	0xe0ebfbf6 0xe5285e0f 0xfcdba234 0xfdb0ae47 

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceNpUtility_stub.a
libSceNpUtility_stub_a_SOURCES = SceNpUtility_stub.S 
am_libSceNpUtility_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceNpUtility_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceNpUtility_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceNpUtility_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@