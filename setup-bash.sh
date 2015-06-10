#! /bin/sh

#
# Configure Bash
#

# Backup global bash configuration file
cp -v /etc/bash.bashrc /etc/bash.bashrc.backup

# Backup previous .bashrc files
for DIR in $(echo "/root `ls /home | sed 's:^:/home/:'`"); do
	if [ "$DIR" = '/home/lost+found' ]; then continue; fi
	cp -v $DIR/.bashrc $DIR/.bashrc.backup
done

# Install new global bash configuration file
cp -fv bash.bashrc /etc/bash.bashrc

# Overwrite .bashrc files
cp -fv .bashrc /etc/skel/.bashrc
cp -fv .bashrc /root/.bashrc
for TARGETUSER in $(ls /home); do
	if [ "$TARGETUSER" = 'lost+found' ]; then continue; fi
	cp -fv .bashrc /home/$TARGETUSER/.bashrc
	chown $TARGETUSER:$TARGETUSER /home/$TARGETUSER/.bashrc
done
