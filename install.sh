#! /bin/bash

#
# Post-installation script for Debian stable
#


# Create installation directory
INSTALLDIR=`cat installdir`
mkdir $INSTALLDIR
cp -Rfv . $INSTALLDIR

# Backup previous configuration files
. /config-backup.sh

# Backup and remove previous bash configuration files
DIRLIST="/root /etc/skel `ls /home | sed 's:^:/home/:'`"
for DIR in $DIRLIST; do
	cp -pfv --parents $DIR/.bashrc $DIR/.profile $INSTALLDIR/backup
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
