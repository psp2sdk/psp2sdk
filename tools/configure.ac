#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_INIT(psp2toolchain, 0.0, https://github.com/173210/psp2sdk/issues)
AC_CONFIG_SRCDIR(psp2-fixup/psp2-fixup.c)

AM_INIT_AUTOMAKE(foreign)

# Checks for programs.
AC_PROG_CC

CFLAGS="$CFLAGS -I\$(top_srcdir)/include"
if test "$ac_compiler_gnu" = yes; then
	CFLAGS="$CFLAGS -Wall"
fi

# Checks for header files.
AC_CHECK_HEADERS(stddef.h stdlib.h string.h, ,
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

# Checks for library functions.
AC_FUNC_MALLOC
if test HAVE_MALLOC = 0; then
	AC_MSG_ERROR(invalid malloc.)
fi

AC_OUTPUT(Makefile psp2-fixup/Makefile psp2-fixup-lib/Makefile)
