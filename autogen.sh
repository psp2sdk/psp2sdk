#!/bin/sh
# Copyright (C) 2015 PSP2SDK Project
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

if test -d src; then
  echo Running src/autogen.sh ...
  (cd src ; ./autogen.sh "$@")
  echo Done running src/autogen.sh ...
fi

if test -d tools; then
  echo Running tools/autogen.sh ...
  (cd src ; ./autogen.sh "$@")
  echo Done running tools/autogen.sh ...
fi
