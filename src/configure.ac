#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_INIT(psp2sdk, 0.0, https://github.com/173210/psp2sdk/issues)
AC_CONFIG_SRCDIR(include/psp2moduleinfo.h)

AM_INIT_AUTOMAKE(foreign -Wno-portability)

# Checks for programs.
AC_PROG_CC
AC_PROG_RANLIB
if test "$RANLIB" = :; then
	AC_MSG_ERROR(ranlib not found.)
fi

CFLAGS="$CFLAGS -I\$(top_srcdir)/include"
if test "$ac_compiler_gnu" = yes; then
	CFLAGS="$CFLAGS -Wall"
fi

AM_PROG_AS

# Checks for header files.
AC_CHECK_HEADERS(stddef.h stdint.h, , AC_MSG_ERROR(header files not found.))

# Checks for typedefs, structures, and compiler characteristics.
AC_CHECK_TYPES(size_t, , AC_MSG_ERROR(size_t not defined.),
	[#include <stddef.h>])
AC_CHECK_TYPES(uint8_t, , AC_MSG_ERROR(uint8_t not defined.),
	[#include <stdint.h>])
AC_CHECK_TYPES(uint16_t, , AC_MSG_ERROR(uint16_t not defined.),
	[#include <stdint.h>])
AC_CHECK_TYPES(uint32_t, , AC_MSG_ERROR(uint32_t not defined.),
	[#include <stdint.h>])

AC_OUTPUT([Makefile stubs/Makefile
	stubs/SceAppMgr_stub/Makefile
	stubs/SceAppUtil_stub/Makefile
	stubs/SceAtrac_stub/Makefile
	stubs/SceAudio_stub/Makefile
	stubs/SceCommonDialog_stub/Makefile
	stubs/SceDbg_stub/Makefile
	stubs/SceFios_stub/Makefile
	stubs/SceGxm_stub/Makefile
	stubs/SceHeap_stub/Makefile
	stubs/SceHmac_stub/Makefile
	stubs/SceLibKernel_stub/Makefile
	stubs/SceLibMonoBridge_stub/Makefile
	stubs/SceLibc_stub/Makefile
	stubs/ScePower_stub/Makefile
	stubs/SceSha_stub/Makefile
	stubs/SceShutterSound_stub/Makefile
	stubs/SceSqlite_stub/Makefile
	stubs/SceSysmodule_stub/Makefile])
