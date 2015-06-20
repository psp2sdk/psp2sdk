#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

AC_INIT(PSP2SDK, dirty-m4_esyscmd_s([git describe --always]),
	https://github.com/173210/psp2sdk/issues)
AC_CONFIG_SRCDIR(psp2-fixup/psp2-fixup.c)

AM_INIT_AUTOMAKE(foreign)

# Checks for programs.
AC_PROG_CC

if test "$ac_compiler_gnu" = yes; then
	CFLAGS="$CFLAGS -Wall -flto"
fi

# Checks for header files.
AC_CHECK_HEADERS(stddef.h stdlib.h string.h, openssl/sha.h,
	AC_MSG_ERROR(header files not found.))

# Checks for typedefs, structures, and compiler characteristics.
AC_CHECK_TYPES(size_t, , AC_MSG_ERROR(size_t not defined.),
	[#include <stddef.h>])
AC_CHECK_TYPES(uint8_t, , AC_MSG_ERROR(uint8_t not defined.),
	[#include <stdint.h>])
AC_CHECK_TYPES(uint16_t, , AC_MSG_ERROR(uint16_t not defined.),
	[#include <stdint.h>])
AC_CHECK_TYPES(uint32_t, , AC_MSG_ERROR(uint32_t not defined.),
	[#include <stdint.h>])

AC_C_BIGENDIAN(AC_MSG_ERROR(bigendian host not supported.))

# Checks for a library function.
AC_CHECK_LIB(crypto, SHA1, , AC_MSG_ERROR(SHA1 not supported by libcrypto.))

AC_OUTPUT(Makefile psp2-fixup/Makefile)
