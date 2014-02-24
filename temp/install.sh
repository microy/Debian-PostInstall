#!/bin/bash

set -e

echo "Copie des fichiers de configuration..."
tar xvpfJ /usr/share/mr-debian-minimal/mr-debian-minimal.tar.xz -C /

echo "Désactivation de udev sur les interfaces réseaux..."
rm -fv /etc/udev/rules.d/70-persistent-net.rules
: > /etc/udev/rules.d/75-persistent-net-generator.rules

echo "Nettoyage du /etc/skel..."
rm -fv /etc/skel/.profile
rm -fv /etc/skel/.bashrc

echo "Nettoyage du /root..."
rm -fv /root/.bashrc
rm -fv /root/.profile

echo "Nettoyage du /home..."
for USER in `ls /home`
do
	rm -fv /home/$USER/.bashrc
	rm -fv /home/$USER/.profile
done


echo "Done."
