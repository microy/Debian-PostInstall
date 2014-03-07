#!/bin/bash

set -e

echo "Copy configuration files..."
tar xvfJ /usr/share/mr-debian-minimal/mr-debian-minimal.tar.xz -C /

echo "Disable network interfaces in udev..."
rm -fv /etc/udev/rules.d/70-persistent-net.rules
: > /etc/udev/rules.d/75-persistent-net-generator.rules

echo 'Activation de la coloration syntaxique et du fond noir pour vim...'
sed -i 's/^"syntax on/syntax on/' /etc/vim/vimrc
sed -i 's/^"set background/set background/' /etc/vim/vimrc

echo "Cleanup /etc/skel..."
rm -fv /etc/skel/.profile
rm -fv /etc/skel/.bashrc

echo "Cleanup /root..."
rm -fv /root/.bashrc
rm -fv /root/.profile

echo "Cleanup /home..."
for USER in `ls /home`
do
	rm -fv /home/$USER/.bashrc
	rm -fv /home/$USER/.profile
done


echo "Done."
