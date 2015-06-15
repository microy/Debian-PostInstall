#! /bin/sh

#
# Base system configuration
#

# Setup apt sources in France
cp -afv /etc/apt/sources.list /etc/apt/sources.list.$(date "+%Y%m%d")
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
apt install -y tree vim deborphan minicom mtr-tiny tcpdump ndisc6 \
netcat-openbsd netstat-nat iperf ipcalc iptraf htop iftop iotop bmon

# Remove persistent network interface in udev
rm -fv /etc/udev/rules.d/70-persistent-net.rules
: > /etc/udev/rules.d/75-persistent-net-generator.rules

# Configure Bash global configuration file
cp -afv /etc/bash.bashrc /etc/bash.bashrc.$(date "+%Y%m%d")
cp -fv bash.bashrc /etc/bash.bashrc

# Configure .bashrc files
cp -afv /root/.bashrc /root/.bashrc.$(date "+%Y%m%d")
cp -fv .bashrc /root/.bashrc
cp -fv .bashrc /etc/skel/.bashrc
for i in $(ls /home); do
	if [ "$i" = 'lost+found' ]; then continue; fi
	cp -afv /home/$i/.bashrc /home/$i/.bashrc.$(date "+%Y%m%d")
	cp -fv .bashrc /home/$i/.bashrc
	chown $i:$i /home/$i/.bashrc
done

# Enable conf file syntax highlighting in Nano
cp -afv /etc/nanorc /etc/nanorc.$(date "+%Y%m%d")
cp -fv conf.nanorc /usr/share/nano/conf.nanorc
echo '
## Configuration files (catch-all syntax)
include "/usr/share/nano/conf.nanorc"' >> /etc/nanorc

# Enable syntax highlighting in Vim
echo '" Enable syntax highlighting by default.
syntax on' > /etc/vim/vimrc.local

# Zero GRUB timeout
#sed -i 's/GRUB_TIMEOUT=.*/GRUB_TIMEOUT=0/' /etc/default/grub
#update-grub

