#! /bin/sh -e

#
# Install VirtualBox guest additions configuration for Debian
#

# Remove any previous virtualbox guest packages
apt-get purge -y --force-yes virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11 virtualbox-ose-guest-x11

# Install necessary packages
apt-get install -y --force-yes build-essential module-assistant

# Remove any left dependencies
apt-get autoremove --purge -y --force-yes

# Prepare kernel headers
m-a prepare

# Mount the VirtualBox guest additions CD
mount /media/cdrom

# Install VirtualBox guest additions
sh /media/cdrom/VBoxLinuxAdditions.run

# Eject the VirtualBox guest additions CD
eject /media/cdrom
