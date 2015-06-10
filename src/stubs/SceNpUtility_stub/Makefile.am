# Copyright (C) 2015 PSP2SDK Project
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

PREFIX = _SceNpUtility-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x01284c6e 0x0158b61b 0x027587c4 0x081fa13c 	\
	0x1075589c 0x282bd43c 0x30606c85 0x31b308aa 	\
	0x32b068c4 0x33b64699 0x36da662e 0x40ec7271 	\
	0x5110e17e 0x5387babb 0x58d92efd 0x6690d8e2 	\
	0x6a1bf429 0x7183047c 0x7d140f70 0x8b608bf6 	\
	0x9246a673 0x9e42e922 0x9f44ce45 0xa30e4e17 	\
	0xb0c9dc45 0xb1a14879 0xb4e5a189 0xbae4cd1f 	\
	0xcf956f23 0xe0ebfbf6 0xe5285e0f 0xe956080f 	\
	0xfcdba234 0xfdb0ae47 

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