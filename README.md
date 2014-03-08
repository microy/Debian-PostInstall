# Debian Post-Install

Post-installation script for Debian stable

## Configuration files

### Replace :
   - /etc/apt/sources.list
   - /etc/bash.bashrc
   - /etc/inputrc
   - /etc/nanorc

### Add : 
   - /etc/fonts/local.conf
   - /etc/modprobe.d/blacklist-pcspkr.conf
   - /etc/udev/rules.d/75-persistent-net-generator.rules
   - /etc/vim/vimrc.local
   - /usr/share/nano/conf.nanorc

### Remove:
   - /etc/udev/rules.d/70-persistent-net.rules
   - /etc/skel/.bashrc
   - /etc/skel/.profile
   - /home/$USER/.bashrc
   - /home/$USER/.profile
   - /root/.bashrc
   - /root/.profile

## Packages

### Add :
   - vim
   - tree
   - htop

### Remove :
   - vim-tiny
