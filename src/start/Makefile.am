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

all: crt0.o

.c.o:
	$(CC) $(CCASFLAGS) -flto $< -c -o $@

install-exec-hook: crt0.o psp2.x
	$(mkinstalldirs) $(libdir)
	$(INSTALL_DATA) crt0.o $(libdir)/crt0.o
	$(INSTALL_DATA) psp2.x $(exec_prefix)
	$(INSTALL_DATA) psp2.specs $(exec_prefix)

uninstall-hook:
	rm -f $(libdir)/crt0.o $(libdir)/psp2.x $(libdir)/psp2.specs

CLEANFILES = crt0.o
