#! /bin/sh

#
# Base system configuration
#

# Setup apt sources in France
cp -fv config/sources.list.france /etc/apt/sources.list

# Update the package database
apt update

# Install some useful applications
apt purge -y vim-tiny netcat-traditional
apt install -y tree vim unzip deborphan git minicom mtr-tiny tcpdump ndisc6 \
netcat-openbsd netstat-nat iperf ipcalc iptraf htop iftop iotop bmon nmap \
openssh-server

# Remove persistent network interface in udev
rm -fv /etc/udev/rules.d/70-persistent-net.rules
: > /etc/udev/rules.d/75-persistent-net-generator.rules

# Configure global bashrc file
cp -fv config/bash.bashrc /etc/bash.bashrc

# Remove local bashrc files
rm -fv /root/.bashrc
rm -fv /etc/skel/.bashrc
for USER in $(ls /home); do
	if [ "$USER" = 'lost+found' ]; then continue; fi
	rm -fv /home/$USER/.bashrc
done

# Setup Nano
cp -fv config/conf.nanorc /usr/share/nano/conf.nanorc
cp -fv config/nanorc /etc/nanorc

# Setup Vim
cp -fv config/vimrc /etc/vim/vimrc

# Setup minicom
cp -fv config/minicom.conf /etc/minicom/minirc.dfl

# Install VirtualBox guest additions
if whiptail --title "VirtualBox setup" --yesno "Install VirtualBox guest additions ?" --defaultno 10 50; then
	apt install -y --no-install-recommends virtualbox-guest-dkms linux-headers-amd64
fi

# Zero GRUB timeout
if whiptail --title "GRUB setup" --yesno "Zero GRUB timeout ?" --defaultno 10 50; then
	sed -i 's/GRUB_TIMEOUT=.*/GRUB_TIMEOUT=0/' /etc/default/grub
	update-grub
fi

