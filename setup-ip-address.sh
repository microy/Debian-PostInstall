#! /bin/sh

#
# Add the IP addresses ot th network interfaces
# in the pre-logion console message (/etc/issue)
#

# Backup the previous login message
cp -fv /etc/issue /etc/issue-standard
# Install the script to update the login message
cp -fv config/show-ip-address /etc/network/if-up.d/show-ip-address
