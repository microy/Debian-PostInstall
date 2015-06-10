#! /bin/sh

#
# Configure Bash
#

# Backup global bash configuration file
cp -v /etc/bash.bashrc /etc/bash.bashrc.backup

# Backup previous .bashrc files
cp -fv /root/.bashrc /root/.bashrc.backup
for TARGETUSER in $(ls /home); do
	if [ "$TARGETUSER" = 'lost+found' ]; then continue; fi
	cp -fv /home/$TARGETUSER/.bashrc /home/$TARGETUSER/.bashrc.backup
	chown $TARGETUSER:$TARGETUSER /home/$TARGETUSER/.bashrc.backup
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
