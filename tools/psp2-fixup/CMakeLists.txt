# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(FIXUP_BIN psp2-fixup)

set(FIXUP_SRCS
    elf.c
    info.c
    psp2-fixup.c
    rel.c
    scn.c
    seg.c
    stub.c
)

set(FIXUP_HDRS
    elf.h
    elf_priv.h
    elf_psp2.h
    info.h
    rel.h
    scn.h
    seg.h
    stub.h
)

add_executable(${FIXUP_BIN} ${FIXUP_SRCS} ${FIXUP_HDRS})

#User includes dirs (won't hide warnings)
target_include_directories(${FIXUP_BIN} PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${OPENSSL_INCLUDE_DIR}
)

target_link_libraries(${FIXUP_BIN}
    ${OPENSSL_CRYPTO_LIBRARY} -lcrypto) # FIXME OPENSSL_CRYPTO_LIBRARY shouldn't be empty

target_compile_definitions(${FIXUP_BIN} PRIVATE -DPACKAGE_NAME="PSP2SDK") # FIXME
target_compile_definitions(${FIXUP_BIN} PRIVATE -DPACKAGE_VERSION="0.0.1-master") # FIXME

install(TARGETS ${FIXUP_BIN} DESTINATION bin)
