#! /bin/sh

#
# Install and configure useful console applications
#

# Install some useful applications
apt update
apt purge -y vim-tiny netcat-traditional
apt install -y tree htop vim mtr-tiny netcat-openbsd \
netstat-nat iperf ipcalc deborphan minicom ndisc6 iftop tcpdump iotop \
iptraf bmon

# Configure bash global configuration file
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

# Enable conf file syntax highlighting in Nano
cp -afv /etc/nanorc /etc/nanorc.$(date "+%Y%m%d")
cp -fv conf.nanorc /usr/share/nano/conf.nanorc
echo '
## Configuration files (catch-all syntax)
include "/usr/share/nano/conf.nanorc"' >> /etc/nanorc

# Enable syntax highlighting in Vim
echo '" Enable syntax highlighting by default.
syntax on' > /etc/vim/vimrc.local
