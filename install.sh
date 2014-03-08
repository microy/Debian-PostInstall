#!/bin/bash

set -e

echo "Copy configuration files..."
cp -rfv config/* /

echo "Disable network interfaces in udev..."
rm -fv /etc/udev/rules.d/70-persistent-net.rules
: > /etc/udev/rules.d/75-persistent-net-generator.rules

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

echo "Remove packages..."
apt-get purge -y --force-yes vim-tiny

echo "Update packages..."
apt-get update
apt-get upgrade

echo "Install packages..."
apt-get install -y --force-yes vim tree htop 

echo "Done."
