#! /bin/sh

#
# Regenerate SSH host keys
#

# Delete previous SSH host keys
rm -fv /etc/ssh/ssh_host_*

# Generate new SSH host keys
dpkg-reconfigure openssh-server