# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

cmake_minimum_required(VERSION 2.8.12 FATAL_ERROR)
project(PSP2SDK)

install(DIRECTORY ${CMAKE_SOURCE_DIR}/include DESTINATION ${PROJECT_BINARY_DIR}/include)

include_directories(${CMAKE_SOURCE_DIR}/include)

add_subdirectory(start)
# add_subdirectory(stubs)
