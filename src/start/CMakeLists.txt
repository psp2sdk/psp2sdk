# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# set(CRT0_SRC ${CMAKE_CURRENT_SOURCE_DIR}/crt0.c)
# set(CRT0_OBJ ${CMAKE_CURRENT_BINARY_DIR}/crt0.o)
# set(CRT0_FLAGS ${CMAKE_C_FLAGS} -flto)
#
# separate_arguments(CRT0_FLAGS)
#
# add_custom_target(crt ALL
#     COMMAND ${CMAKE_C_COMPILER} ${CRT0_FLAGS} -c ${CRT0_SRC} -o ${CRT0_OBJ} -I${CMAKE_SOURCE_DIR}/include
# )

# set(prefix ${CMAKE_INSTALL_PREFIX})
# configure_file(${CMAKE_CURRENT_SOURCE_DIR}/psp2.specs.in ${CMAKE_CURRENT_SOURCE_DIR}/psp2.specs @ONLY)
# unset(prefix)

# install(FILES ${CRT0_OBJ} DESTINATION ${PROJECT_BINARY_DIR})
# install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/psp2.specs DESTINATION ${PROJECT_BINARY_DIR})
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/psp2.x DESTINATION .)
