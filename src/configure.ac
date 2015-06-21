#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

AC_INIT(PSP2SDK, dirty-m4_esyscmd_s([git describe --always]),
	https://github.com/173210/psp2sdk/issues)
AC_CONFIG_SRCDIR(include/psp2/moduleinfo.h)

AM_INIT_AUTOMAKE(foreign -Wno-portability)

# Checks for programs.
AC_PROG_CC
AC_PROG_RANLIB
if test "$RANLIB" = :; then
	AC_MSG_ERROR(ranlib not found.)
fi

CFLAGS="$CFLAGS -I\$(top_srcdir)/include"
if test "$ac_compiler_gnu" = yes; then
	CFLAGS="$CFLAGS -Wall -mcpu=cortex-a9 -mfpu=neon-fp16"
fi

AC_CHECK_TOOL(AR, ar, :)
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

AC_OUTPUT([Doxyfile Makefile include/Makefile start/Makefile stubs/Makefile
	stubs/SceNpUtility_stub/Makefile
	stubs/SceHmac_stub/Makefile
	stubs/SceCodecEnginePerf_stub/Makefile
	stubs/SceLiveArea_stub/Makefile
	stubs/SceTouch_stub/Makefile
	stubs/SceSsl_stub/Makefile
	stubs/SceSha256_stub/Makefile
	stubs/SceDisplay_stub/Makefile
	stubs/SceSha384_stub/Makefile
	stubs/SceCommonDialog_stub/Makefile
	stubs/ScePgf_stub/Makefile
	stubs/SceNpBasic_stub/Makefile
	stubs/SceDbg_stub/Makefile
	stubs/SceFiber_stub/Makefile
	stubs/SceUlt_stub/Makefile
	stubs/SceNearDialogUtil_stub/Makefile
	stubs/SceLocationExtension_stub/Makefile
	stubs/SceHeap_stub/Makefile
	stubs/SceNetDebug_stub/Makefile
	stubs/SceNgs_stub/Makefile
	stubs/SceGxm_stub/Makefile
	stubs/ScePvf_stub/Makefile
	stubs/SceAvPlayer_stub/Makefile
	stubs/SceMotion_stub/Makefile
	stubs/SceVideodec_stub/Makefile
	stubs/SceXml_stub/Makefile
	stubs/SceHandwriting_stub/Makefile
	stubs/ScePspnetAdhoc_stub/Makefile
	stubs/SceSqlite_stub/Makefile
	stubs/SceNpMatching2_stub/Makefile
	stubs/SceAudiodec_stub/Makefile
	stubs/SceSfmt1279_stub/Makefile
	stubs/SceSfmt4253_stub/Makefile
	stubs/SceNet_stub/Makefile
	stubs/SceSulpha_stub/Makefile
	stubs/SceAppMgr_stub/Makefile
	stubs/SceMusicExport_stub/Makefile
	stubs/SceKernel_stub/Makefile
	stubs/SceRudp_stub/Makefile
	stubs/SceCamera_stub/Makefile
	stubs/SceGameUpdate_stub/Makefile
	stubs/SceNetAdhocMatching_stub/Makefile
	stubs/SceMt19937_stub/Makefile
	stubs/SceDeci4p_stub/Makefile
	stubs/SceVoice_stub/Makefile
	stubs/SceRazorCapture_stub/Makefile
	stubs/SceNpMessage_stub/Makefile
	stubs/SceSfmt132049_stub/Makefile
	stubs/SceSfmt216091_stub/Makefile
	stubs/SceNpSnsFacebook_stub/Makefile
	stubs/SceSha1_stub/Makefile
	stubs/SceFpu_stub/Makefile
	stubs/SceNpManager_stub/Makefile
	stubs/SceNpScore_stub/Makefile
	stubs/SceNpSignaling_stub/Makefile
	stubs/SceAudioIn_stub/Makefile
	stubs/SceSfmt19937_stub/Makefile
	stubs/SceNpTrophy_stub/Makefile
	stubs/SceNpCommerce2_stub/Makefile
	stubs/SceLibstdc++_stub/Makefile
	stubs/SceVoiceQoS_stub/Makefile
	stubs/SceLibm_stub/Makefile
	stubs/SceShutterSound_stub/Makefile
	stubs/SceNearUtil_stub/Makefile
	stubs/SceSha0_stub/Makefile
	stubs/SceCodecEngine_stub/Makefile
	stubs/ScePower_stub/Makefile
	stubs/SceAudioenc_stub/Makefile
	stubs/SceSfmt11213_stub/Makefile
	stubs/SceSha512_stub/Makefile
	stubs/SceSfmt2281_stub/Makefile
	stubs/SceJpeg_stub/Makefile
	stubs/SceHttp_stub/Makefile
	stubs/SceJpegEnc_stub/Makefile
	stubs/SceCoredump_stub/Makefile
	stubs/SceNpActivity_stub/Makefile
	stubs/SceSfmt86243_stub/Makefile
	stubs/SceSysmodule_stub/Makefile
	stubs/ScePerf_stub/Makefile
	stubs/SceSfmt44497_stub/Makefile
	stubs/SceSystemGesture_stub/Makefile
	stubs/SceSha224_stub/Makefile
	stubs/SceNpParty_stub/Makefile
	stubs/SceIme_stub/Makefile
	stubs/SceDeflt_stub/Makefile
	stubs/SceSmart_stub/Makefile
	stubs/SceNetCtl_stub/Makefile
	stubs/SceNpCommon_stub/Makefile
	stubs/SceDTrace_stub/Makefile
	stubs/ScePhotoExport_stub/Makefile
	stubs/SceAudio_stub/Makefile
	stubs/SceLocation_stub/Makefile
	stubs/SceFace_stub/Makefile
	stubs/SceSfmt607_stub/Makefile
	stubs/SceLibc_stub/Makefile
	stubs/SceClipboard_stub/Makefile
	stubs/SceFios2_stub/Makefile
	stubs/SceAtrac_stub/Makefile
	stubs/SceRtc_stub/Makefile
	stubs/SceSas_stub/Makefile
	stubs/SceScreenShot_stub/Makefile
	stubs/SceRazorHud_stub/Makefile
	stubs/SceSha512t_stub/Makefile
	stubs/SceMd5_stub/Makefile
	stubs/SceNpTus_stub/Makefile
	stubs/SceCtrl_stub/Makefile
	stubs/SceAppUtil_stub/Makefile])
