#! /bin/bash

#
# Post-installation script for Debian stable
#

# Create backup directory
mkdir backup

# Backup previous configuration files
for FILE in $(find config -type f | sed 's:^config::'); do
	if [ -f $FILE ]; then
		cp -pfv --parents $FILE backup
	fi
done

# Backup and remove previous bash configuration files
for DIR in $(echo "/root /etc/skel `ls /home | sed 's:^:/home/:'`"); do
	cp -pfv --parents $DIR/.bashrc $DIR/.profile backup
	rm -fv $DIR/.bashrc $DIR/.profile
done

# Copy local configuration files
cp -Rfv config/* /

# Remove previous network interface detection in udev
rm -fv /etc/udev/rules.d/70-persistent-net.rules

# Update packages
apt-get update
apt-get purge -y --force-yes vim-tiny
apt-get install -y --force-yes vim tree htop bash-completion nano
apt-get clean
