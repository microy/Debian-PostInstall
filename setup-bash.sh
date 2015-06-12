#! /bin/sh

#
# Configure Bash
#

# Configure global bash configuration file
cp -afv /etc/bash.bashrc /etc/bash.bashrc.$(date "+%Y%m%d")
cp -fv bash.bashrc /etc/bash.bashrc

# Configure .bashrc files
cp -afv /root/.bashrc /root/.bashrc.$(date "+%Y%m%d")
cp -fv .bashrc /root/.bashrc
cp -fv .bashrc /etc/skel/.bashrc
for u in $(ls /home); do
	if [ "$u" = 'lost+found' ]; then continue; fi
	cp -afv /home/$u/.bashrc /home/$u/.bashrc.$(date "+%Y%m%d")
	cp -fv .bashrc /home/$u/.bashrc
	chown $u:$u /home/$u/.bashrc
done
