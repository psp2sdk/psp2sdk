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

PREFIX = _SceVoiceQoS-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x2d613549 0x2fe1f28f 0x3c7a08b0 0x4b5fff1c 	\
	0x540ceba5 0x68fabf6f 0x876a9b9c 0xaab54be4 	\
	0xbab98727 0xc2f2c771 0xc981ab3b 0xc9dc1425 	\
	0xe0c5ceee 0xe5b4527d 0xe757806f 0xe81b8d44 	\
	0xfb0b747b 

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceVoiceQoS_stub.a
libSceVoiceQoS_stub_a_SOURCES = SceVoiceQoS_stub.S 
am_libSceVoiceQoS_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceVoiceQoS_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceVoiceQoS_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceVoiceQoS_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@