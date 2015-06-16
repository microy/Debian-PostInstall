#! /bin/sh

#
# User account setup
#

# Configuration
adduser --add_extra_groups etudiant
addgroup etudiant dip
addgroup etudiant lpadmin
addgroup etudiant netdev
addgroup etudiant sudo
addgroup etudiant vboxusers
addgroup etudiant wireshark


adduser --disabled-password --disabled-login admin
mkdir /home/admin/.ssh
touch /home/admin/.ssh/authorized_keys
chown -R admin:admin /home/admin/.ssh
#cat id_rsa.pub >> /home/admin/.ssh/authorized_keys
echo 'admin  ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers


