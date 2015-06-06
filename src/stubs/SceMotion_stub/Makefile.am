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

PREFIX = _SceMotion-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x047f060a 0x0fd2cda2 0x112e0eae 0x122a79f8 	\
	0x20f00078 0x28034ac9 0x3d4813ae 0x47d679ea 	\
	0x499b6c87 0x4f28bfe0 0x917ea390 0xa4a7e6e2 	\
	0xaf09fcdb 0xaf32cb1d 0xbdb32767 0xc1652201 	\
	0xc1a7395a 0xdacb2a41 0xe8a28da5 

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceMotion_stub.a
libSceMotion_stub_a_SOURCES = SceMotion_stub.S 
am_libSceMotion_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceMotion_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceMotion_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceMotion_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@