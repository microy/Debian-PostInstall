#! /bin/sh

#
# Install and configure NTP service
#

# Install NTP packages
apt update
apt install -y ntp

# Configure NTP servers for France
sed -i 's/.debian./.fr./' /etc/ntp.conf

# Restart NTP service
service ntp restart

