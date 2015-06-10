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

PREFIX = _SceAvPlayer-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x11ff162d 0x15365ece 0x22986cd1 0x2acb4217 	\
	0x2cd86fd6 0x2e4ff35f 0x34e2d370 0x34fd744b 	\
	0x3f51d38a 0x4c847adf 0x5b7db4bc 0x70127ab8 	\
	0x7aa29b2d 0x804dcecd 0x86e0cf55 0x8bc3221b 	\
	0xa10fc252 0xbc83c8fd 0xbd35e360 0xec103adf 

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceAvPlayer_stub.a
libSceAvPlayer_stub_a_SOURCES = SceAvPlayer_stub.S 
am_libSceAvPlayer_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceAvPlayer_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceAvPlayer_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceAvPlayer_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@