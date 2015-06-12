#! /bin/sh

#
# Cleanup log files
#

find /var/log -type f -print -delete
: > /var/log/btmp
: > /var/log/wtmp
