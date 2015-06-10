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

PREFIX = _SceFace-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x17f3dc79 0x37704de9 0x4468b054 0x64f45021 	\
	0x67f0585a 0x707b9a1d 0x70c9cf95 0x73e9791d 	\
	0x7d71725d 0x87550392 0x8f8e9fb1 0xa905a467 	\
	0xb794c6cb 0xc0812127 0xcc98b939 0xcf07e1c4 	\
	0xe521eb6f 0xf24b851d 0xf3045394 0xf7e4ec1f 	\
	0xf852e35d 

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceFace_stub.a
libSceFace_stub_a_SOURCES = SceFace_stub.S 
am_libSceFace_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceFace_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceFace_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceFace_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@