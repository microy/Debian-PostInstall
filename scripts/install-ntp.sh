#! /bin/sh

#
# Install and configure NTP service
#

# Install NTP packages
apt-get update
apt-get install -y --force-yes ntp

# Configure NTP servers for France
sed -i 's/.debian./.fr./' /etc/ntp.conf

# Restart NTP service
service ntp restart

