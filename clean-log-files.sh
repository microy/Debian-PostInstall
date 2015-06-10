#! /bin/sh

#
# Cleanup log files
#

find /var/log -type f  -exec rm -fv {} \;
: > /var/log/btmp
: > /var/log/wtmp
