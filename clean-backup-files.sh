#! /bin/sh

#
# Remove backup files *~
#

find . -type f -name '*~' -print -delete
