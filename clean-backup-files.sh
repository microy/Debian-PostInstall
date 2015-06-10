#! /bin/sh

#
# Remove backup files *~
#

find . -type f -name '*~' -exec rm -v {} \;
