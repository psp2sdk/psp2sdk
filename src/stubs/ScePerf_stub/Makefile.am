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

PREFIX = _ScePerf-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x0de231d4 0x12f6c708 0x35151735 0x3f29e937 	\
	0x409d966a 0x4264b4e7 0x453aed06 0x4b47e144 	\
	0x4f1385e3 0x5cdc09ea 0x6132a497 0x63cbea8b 	\
	0x78ea4ffb 0x7ad6ac30 0x8da87b35 0x8f7b522c 	\
	0x9c2c05c2 0x9d5b9621 0xaed36a40 0xbd9615e5 	\
	0xc3de4c0a 0xc9d969d5 0xd1a40f54 0xdab63fc3 	\
	0xdc3224c3 0xf7f8adce 0x936a5f31 

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libScePerf_stub.a
libScePerf_stub_a_SOURCES = ScePerf_stub.S 
am_libScePerf_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libScePerf_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libScePerf_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libScePerf_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@