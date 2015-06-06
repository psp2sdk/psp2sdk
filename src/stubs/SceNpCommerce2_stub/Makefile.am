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

PREFIX = _SceNpCommerce2-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x021dc797 0x0550c016 0x118e1c5e 0x123e55f4 	\
	0x18bdc4bd 0x24d3fe34 0x29186e27 0x315b9bd0 	\
	0x363922ba 0x3b7c81a5 0x4dfbcdd6 0x5135ea31 	\
	0x56b80faf 0x586b0599 0x5cf665e0 0x6cd27bd0 	\
	0x7132eaa5 0x774f88d0 0x7894dcdf 0x84c336c6 	\
	0x84e56a6d 0x88d236df 0x9cd463f8 0xa308b496 	\
	0xa4464754 0xadf3bd5b 0xaee8d3df 0xb0aff6c9 	\
	0xb88db7c2 0xb99958ae 0xba5a5784 0xbbddf866 	\
	0xc47cdb59 0xc594adc2 0xc73f209a 0xd6a5b200 	\
	0xde45f84f 0xe7486a60 0xe81b8bad 0xf6f23623 	\
	0xfdb39774 0xffc8b18b 

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceNpCommerce2_stub.a
libSceNpCommerce2_stub_a_SOURCES = SceNpCommerce2_stub.S 
am_libSceNpCommerce2_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceNpCommerce2_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceNpCommerce2_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceNpCommerce2_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@