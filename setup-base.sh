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

# Remove local bashrc files
rm -fv /root/.bashrc
rm -fv /etc/skel/.bashrc
for USER in $(ls /home); do
	rm -fv /home/$USER/.bashrc
done

# Enable conf file syntax highlighting in Nano
cp -fv conf.nanorc /usr/share/nano/conf.nanorc
echo '
## Configuration files (catch-all syntax)
include "/usr/share/nano/conf.nanorc"' >> /etc/nanorc

# Enable syntax highlighting in Vim
sed -i 's/^"syntax on/syntax on/' /etc/vim/vimrc

# Install VirtualBox guest additions
if whiptail --title "VirtualBox setup" --yesno "Install VirtualBox guest additions ?" --defaultno 10 50; then
	apt install -y --no-install-recommends virtualbox-guest-dkms linux-headers-amd64
fi

# Zero GRUB timeout
if whiptail --title "GRUB setup" --yesno "Zero GRUB timeout ?" --defaultno 10 50; then
	sed -i 's/GRUB_TIMEOUT=.*/GRUB_TIMEOUT=0/' /etc/default/grub
	update-grub
fi

