#! /bin/sh

#
# Install and configure useful console applications
#

# Install some applications
apt update
apt purge -y vim-tiny netcat-traditional
apt install -y tree htop vim mtr-tiny netcat-openbsd \
netstat-nat iperf ipcalc deborphan minicom ndisc6 iftop tcpdump iotop \
iptraf bmon

# Configure Nano to highlight the syntax of conf files
cp -afv /etc/nanorc /etc/nanorc.$(date "+%Y%m%d")
cp -fv conf.nanorc /usr/share/nano/conf.nanorc
echo "
## Configuration files (catch-all syntax)
include \"/usr/share/nano/conf.nanorc\"" >> /etc/nanorc

# Enable syntax highlighting in Vim
echo '" Enable syntax highlighting by default.
syntax on' > /etc/vim/vimrc.local
