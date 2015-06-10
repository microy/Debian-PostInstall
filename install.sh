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

# Archive the backup directory
tar cvfJ backup-$(date "+%Y%m%d").tar.xz backup

# Remove the backup directory
rm -rfv backup

# Copy local configuration files
cp -Rfv config/* /

# Overwrite .bashrc files
cp -fv /etc/skel/.bashrc /root
for TARGETUSER in $(ls /home); do
	if [ "$TARGETUSER" = 'lost+found' ]; then continue; fi
	cp -fv /etc/skel/.bashrc /home/$TARGETUSER
	chown $TARGETUSER:$TARGETUSER /home/$TARGETUSER/.bashrc
done
