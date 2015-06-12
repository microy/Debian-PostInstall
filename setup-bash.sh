#! /bin/sh

#
# Configure Bash
#

# Get the date
DATE=$(date "+%Y%m%d")

# Configure global bash configuration file
cp -afv /etc/bash.bashrc /etc/bash.bashrc.backup.$DATE
cp -fv bash.bashrc /etc/bash.bashrc

# Configure .bashrc files
cp -afv /root/.bashrc /root/.bashrc.backup.$DATE
cp -fv .bashrc /root/.bashrc
cp -fv .bashrc /etc/skel/.bashrc
for u in $(ls /home); do
	if [ "$u" = 'lost+found' ]; then continue; fi
	cp -afv /home/$u/.bashrc /home/$u/.bashrc.backup.$DATE
	cp -fv .bashrc /home/$u/.bashrc
	chown $u:$u /home/$u/.bashrc
done
