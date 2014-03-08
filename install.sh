#! /bin/bash -e

#
# Post-installation script for Debian stable
#

echo "Copy configuration files..."
cp -rfv config/* /

echo "Disable network interfaces in udev..."
rm -fv /etc/udev/rules.d/70-persistent-net.rules
: > /etc/udev/rules.d/75-persistent-net-generator.rules

echo "Remove previous bash configuration files..."
rm -fv /etc/skel/.profile
rm -fv /etc/skel/.bashrc
rm -fv /root/.bashrc
rm -fv /root/.profile
for USER in `ls /home`
do
	rm -fv /home/$USER/.bashrc
	rm -fv /home/$USER/.profile
done

echo "Update packages..."
apt-get update
apt-get purge -y --force-yes vim-tiny
apt-get install -y --force-yes vim tree htop 
apt-get clean

echo "Done."
