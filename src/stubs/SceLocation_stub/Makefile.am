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

PREFIX = _SceLocation-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x07d4dfe0 0x09c4f674 0x12d1f0ea 0x14fe76e8 	\
	0x15bc27c8 0x16f41ed0 0x188ce004 0x1e80199a 	\
	0x482622c6 0x4e9e5ed9 0x71503251 0x730ff842 	\
	0x8aaf3fbd 0x92e53f94 0xaa026b53 0xb1f55065 	\
	0xc895e567 0xdd271661 0xde0a9ea4 0xe3cbf875 	\
	0xed378700 0xff016c13 

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceLocation_stub.a
libSceLocation_stub_a_SOURCES = SceLibLocation_stub.S 
am_libSceLocation_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceLocation_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceLocation_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceLocation_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@