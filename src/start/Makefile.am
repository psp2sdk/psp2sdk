# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

install-exec-hook: psp2.x
	$(mkinstalldirs) $(libdir)
	$(INSTALL_DATA) psp2.x $(exec_prefix)

uninstall-hook:
	rm -f $(libdir)/psp2.x
