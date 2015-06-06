#!/bin/sh
# Copyright (C) 2015 PSP2SDK Project
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

if test -d src; then
  echo Running src/autogen.sh ...
  (cd src ; NOCONFIGURE=1 ./autogen.sh "$@")
  echo Done running src/autogen.sh ...
fi

if test -d tools; then
  echo Running tools/autogen.sh ...
  (cd src ; NOCONFIGURE=1 ./autogen.sh "$@")
  echo Done running tools/autogen.sh ...
fi
