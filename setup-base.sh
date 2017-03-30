#! /bin/sh

#
# Base system configuration
#

# Get the date
DATE=$(date "+%Y%m%d")
# Setup apt sources in France
cp -fv /etc/apt/sources.list /etc/apt/sources.list.$DATE
cp -fv config/sources.list.france /etc/apt/sources.list
# Update the package database and the system
apt update
apt -y upgrade
# Cleanup the packages
apt -y autoremove
apt -y autoclean
# Configure Bash
cp -fv /etc/bash.bashrc /etc/bash.bashrc.$DATE
cp -fv config/bash.bashrc /etc/bash.bashrc
rm -fv /etc/skel/.bashrc
# Configure nano
cp -fv config/conf.nanorc /usr/share/nano/conf.nanorc
# Remove local bashrc files
mv -fv /root/.bashrc /root/.bashrc.$DATE
for USER in $(ls /home); do
	if [ "$USER" = 'lost+found' ]; then continue; fi
	mv -fv /home/$USER/.bashrc /home/$USER/.bashrc.$DATE
done
# Install VirtualBox guest additions
if whiptail --title "VirtualBox setup" --yesno "Install VirtualBox guest additions ?" --defaultno 10 50; then
#	apt install -y --no-install-recommends virtualbox-guest-dkms linux-headers-amd64
	apt install -y dkms linux-headers-amd64 build-essential
	mount /media/cdrom
	cd /media/cdrom
	sh ./VBoxLinuxAdditions.run
fi
# Zero GRUB timeout
if whiptail --title "GRUB setup" --yesno "Zero GRUB timeout ?" --defaultno 10 50; then
	sed -i 's/GRUB_TIMEOUT=.*/GRUB_TIMEOUT=0/' /etc/default/grub
	update-grub
fi
