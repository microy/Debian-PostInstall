#! /bin/sh

#
# Configure Bash
#

# Get the date
DATE=$(date "+%Y%m%d")

# Backup global bash configuration file
cp -afv /etc/bash.bashrc /etc/bash.bashrc.backup.$DATE

# Backup previous .bashrc files
cp -afv /root/.bashrc /root/.bashrc.backup.$DATE
for TARGETUSER in $(ls /home); do
	if [ "$TARGETUSER" = 'lost+found' ]; then continue; fi
	cp -afv /home/$TARGETUSER/.bashrc /home/$TARGETUSER/.bashrc.backup.$DATE
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
