#! /bin/sh

#
# Base system configuration
#

# Setup apt sources in France
echo '# Debian
deb http://ftp.fr.debian.org/debian jessie main contrib non-free
# Updates
deb http://ftp.fr.debian.org/debian jessie-updates main contrib non-free
# Backports
deb http://ftp.fr.debian.org/debian jessie-backports main contrib non-free
# Security
deb http://security.debian.org jessie/updates main contrib non-free' > /etc/apt/sources.list

# Update the package database
apt update

# Install some useful applications
apt purge -y vim-tiny netcat-traditional
apt install -y tree vim unzip deborphan git minicom mtr-tiny tcpdump ndisc6 \
netcat-openbsd netstat-nat iperf ipcalc iptraf htop iftop iotop bmon nmap

# Remove persistent network interface in udev
rm -fv /etc/udev/rules.d/70-persistent-net.rules
: > /etc/udev/rules.d/75-persistent-net-generator.rules

# Configure global bashrc file
cp -fv bash.bashrc /etc/bash.bashrc

# Configure local bashrc files
echo '# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don\'t do anything
[ -z "$PS1" ] && return

# Put your own configuration here.' > /root/.bashrc
cp -fv /root/.bashrc /etc/skel/.bashrc
for USER in $(ls /home); do
	if [ "$USER" = 'lost+found' ]; then continue; fi
	cp -fv /root/.bashrc /home/$USER/.bashrc
	chown $USER:$USER /home/$USER/.bashrc
done

# Enable conf file syntax highlighting in Nano
cp -fv conf.nanorc /usr/share/nano/conf.nanorc
echo '
## Configuration files (catch-all syntax)
include "/usr/share/nano/conf.nanorc"' >> /etc/nanorc

# Enable syntax highlighting in Vim
sed -i 's/^"syntax on/syntax on/' /etc/vim/vimrc

# Zero GRUB timeout
if whiptail --title "GRUB setup" --yesno "Zero GRUB timeout ?" --defaultno 10 50; then
	sed -i 's/GRUB_TIMEOUT=.*/GRUB_TIMEOUT=0/' /etc/default/grub
	update-grub
fi

