#! /bin/sh

#
# Post-installation script for Debian stable
#

# Create backup directory
mkdir backup

# Backup previous configuration files
for FILE in $(find config -type f | sed 's:^config::'); do
	if [ -f "$FILE" ]; then
		cp -pfv --parents "$FILE" backup
	fi
done

# Backup previous .bashrc files
for DIR in $(echo "/root `ls /home | sed 's:^:/home/:'`"); do
	if [ "$DIR" = '/home/lost+found' ]; then continue; fi
	cp -pfv --parents $DIR/.bashrc backup
done

# Copy local configuration files
cp -Rfv config/* /

# Overwrite .bashrc files
cp -fv /etc/skel/.bashrc /root
for TARGETUSER in $(ls /home); do
	if [ "$TARGETUSER" = 'lost+found' ]; then continue; fi
	cp -fv /etc/skel/.bashrc /home/$TARGETUSER
	chown $TARGETUSER:$TARGETUSER /home/$TARGETUSER/.bashrc
done

# Update packages
apt-get update
apt-get purge -y --force-yes vim-tiny
apt-get install -y --force-yes vim tree htop
apt-get clean
