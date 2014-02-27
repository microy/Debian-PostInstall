# Debian Minimal Configuration

Minimal configuration for Debian stable

## Replace :
   - /etc/bash.bashrc
   - /etc/inputrc
   - /etc/nanorc
   - /etc/apt/sources.list

## Add : 
   - /etc/fonts/local.conf
   - /etc/modprobe.d/blacklist-pcspkr.conf
   - /etc/udev/rules.d/75-persistent-net-generator.rules
   - /usr/share/nano/conf.nanorc

## Remove:
   - /etc/udev/rules.d/70-persistent-net.rules
   - /home/$USER/.bashrc
   - /home/$USER/.profile
   - /root/.bashrc
   - /root/.profile
   - /etc/skel/.bashrc
   - /etc/skel/.profile
