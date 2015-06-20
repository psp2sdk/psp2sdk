# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

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
