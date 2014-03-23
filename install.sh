#! /bin/bash

#
# Post-installation script for Debian stable
#

# Variables
CONFFILES='/etc/inputrc /etc/apt/sources.list /etc/bash.bashrc /etc/nanorc /etc/skel/.bashrc /etc/skel/.profile'
INSTALLDIR='/usr/share/debian-postinstall'

# Create installation directory
mkdir $INSTALLDIR
cp -Rfv . $INSTALLDIR

# Backup previous configuration files
mkdir $INSTALLDIR/backup
for FILE in $CONFFILES; do
	cp -fv --parents $FILE $INSTALLDIR/backup
done

# Copy configuration files
cp -Rfv config/* /

# Remove previous bash configuration files
rm -fv /etc/skel/.profile
rm -fv /etc/skel/.bashrc
rm -fv /root/.bashrc
rm -fv /root/.profile
for USER in `ls /home`
do
	rm -fv /home/$USER/.bashrc
	rm -fv /home/$USER/.profile
done

# Disable network interfaces in udev
rm -fv /etc/udev/rules.d/70-persistent-net.rules
: > /etc/udev/rules.d/75-persistent-net-generator.rules

# Update packages
apt-get update
apt-get purge -y --force-yes vim-tiny
apt-get install -y --force-yes vim tree htop bash-completion nano
apt-get clean
