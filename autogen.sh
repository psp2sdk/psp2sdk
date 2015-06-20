#!/bin/sh
# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

if test -d src; then
  echo Running src/autogen.sh ...
  (cd src ; ./autogen.sh "$@")
  echo Done running src/autogen.sh ...
fi

if test -d tools; then
  echo Running tools/autogen.sh ...
  (cd tools ; ./autogen.sh "$@")
  echo Done running tools/autogen.sh ...
fi
