#! /bin/sh

#
# Base system configuration
#

# Setup apt sources in France
cp -fv config/sources.list.france /etc/apt/sources.list

# Update the package database
apt update

# Purge unwanted applications
apt purge -y vim-tiny

# Install some useful applications
apt install -y tree vim git minicom mtr-tiny tcpdump iperf nmap htop

# Configure Bash
cp -fv config/bash.bashrc /etc/bash.bashrc
rm -fv /etc/skel/.bashrc

# Configure Nano
cp -fv config/conf.nanorc /usr/share/nano/conf.nanorc
cp -fv config/nanorc /etc/nanorc

# Configure Vim
cp -fv config/vimrc /etc/vim/vimrc

# Configure minicom
cp -fv config/minirc.dfl /etc/minicom/minirc.dfl

# Remove local bashrc files
if whiptail --title "Bash setup" --yesno "Remove local bashrc files ?" --defaultno 10 50; then
	rm -fv /root/.bashrc
	for USER in $(ls /home); do
		if [ "$USER" = 'lost+found' ]; then continue; fi
		rm -fv /home/$USER/.bashrc
	done
fi

# Install VirtualBox guest additions
if whiptail --title "VirtualBox setup" --yesno "Install VirtualBox guest additions ?" --defaultno 10 50; then
	apt install -y --no-install-recommends virtualbox-guest-dkms linux-headers-amd64
fi

# Zero GRUB timeout
grub_updated=0
if whiptail --title "GRUB setup" --yesno "Zero GRUB timeout ?" --defaultno 10 50; then
	sed -i 's/GRUB_TIMEOUT=.*/GRUB_TIMEOUT=0/' /etc/default/grub
	update-grub
fi
