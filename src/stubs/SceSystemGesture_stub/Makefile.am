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

PREFIX = _SceSystemGesture-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x0d941b90 0x13ad2218 0x480564c9 0x5570b83e 	\
	0x6078a08b 0x74724147 0x789d867c 0x851fb144 	\
	0xa9db29f6 0xb3875104 0xbab8eccb 0xc3367370 	\
	0xc750d3da 0xdf4c665a 0xe0577765 0xf0db1ae5 	\
	0xfd5a6504 

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceSystemGesture_stub.a
libSceSystemGesture_stub_a_SOURCES = SceSystemGesture_stub.S 
am_libSceSystemGesture_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceSystemGesture_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceSystemGesture_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceSystemGesture_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@