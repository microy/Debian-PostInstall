#! /bin/bash

#
# Post-installation script for Debian stable
#

# Backup previous configuration files
CONFFILES='/etc/inputrc /etc/apt/sources.list /etc/bash.bashrc /etc/nanorc /etc/skel/.bashrc /etc/skel/.profile'
for FILE in $CONFFILES; do
	cp -fv $FILE $FILE~
done

# Copy configuration files
cp -rfv config/* /

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
apt-get install -y --force-yes vim tree htop 
apt-get clean
