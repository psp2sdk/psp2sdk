# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

cmake_minimum_required(VERSION 2.8.11 FATAL_ERROR)
project(PSP2SDK)

# Add psp2 header directory
include_directories(${CMAKE_SOURCE_DIR}/include)

# Set compilation flags
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -nostdlib")

# Configure Doxygen file
set(PACKAGE_NAME ${CMAKE_PROJECT_NAME})
set(PACKAGE_VERSION $ENV{REV})
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/Doxyfile.in ${CMAKE_CURRENT_SOURCE_DIR}/Doxyfile @ONLY)
unset(PACKAGE_VERSION)
unset(PACKAGE_NAME)

# Build start files and stubs
add_subdirectory(start)
add_subdirectory(stubs)

# Install headers
install(DIRECTORY include DESTINATION . FILES_MATCHING PATTERN "*.h")
install(DIRECTORY include DESTINATION . FILES_MATCHING PATTERN "*.S")

# Install CMake toolchain file
install(FILES cmake/toolchain-arm-none-eabi-psp2.cmake DESTINATION cmake)
