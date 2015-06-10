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

PREFIX = _SceVoice-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x02f58d6f 0x09e4d18c 0x0a22ec0e 0x0b9e4ae2 	\
	0x1f93fc0c 0x23c6b16b 0x2de35411 0x39aa3884 	\
	0x5933ccfb 0x5e1ce910 0x5f0260f4 0x698bdaae 	\
	0x6e46950e 0x73f72940 0x805cc20f 0x874054ce 	\
	0x875cc80d 0x9b0d3490 0xac98853e 0xae46564d 	\
	0xb2ed725b 0xc3868df6 0xc913f7e9 0xce855c50 	\
	0xd02c00b4 0xd93769e6 0xdb90eac4 0xfa4e57b1 

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceVoice_stub.a
libSceVoice_stub_a_SOURCES = SceVoice_stub.S 
am_libSceVoice_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceVoice_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceVoice_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceVoice_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@