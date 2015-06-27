# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

cmake_minimum_required(VERSION 2.8.11 FATAL_ERROR)
project(PSP2_FIXUP)

find_library(OpenSSL REQUIRED)

add_subdirectory(psp2-fixup)
