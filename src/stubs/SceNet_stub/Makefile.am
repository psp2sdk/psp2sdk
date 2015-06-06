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

PREFIX = _SceNet-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x023643b7 0x04042925 0x0424ae26 0x065505ca 	\
	0x06c05518 0x07845128 0x11e5b6f6 0x1296a94b 	\
	0x12c19209 0x138cf1d6 0x1adf9bb1 0x1c66a6db 	\
	0x1eb11857 0x2348d353 0x29822b4d 0x338edc2e 	\
	0x3559f098 0x38ebbd57 0x3b24e75f 0x45ce337d 	\
	0x4c30b03c 0x4c8764ac 0x52db31d5 0x561dfd03 	\
	0x658b903b 0x69e50bb5 0x6ab3b74b 0x6da29319 	\
	0x7915caf3 0x7a8da094 0x82ddcf63 0x84334eb2 	\
	0x874ef500 0x891c1b9b 0x92d3e767 0x93fcc4e8 	\
	0x98839b74 0x99c579ae 0x9fa3207b 0xa86f8fe5 	\
	0xae3f4ac6 0xaff9fa4d 0xb1af6840 0xb226138b 	\
	0xba652062 0xd2eaa645 0xd5eeb048 0xd62ef218 	\
	0xde94c6fe 0xe37f34aa 0xe3dd8cd9 0xea3cc286 	\
	0xeb03e265 0xeec6d75f 0xf084fce3 0xf9d102ae 	\
	0xfb3336a6 0xfec1166d 

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceNet_stub.a
libSceNet_stub_a_SOURCES = SceNet_stub.S 
am_libSceNet_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceNet_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceNet_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceNet_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@