#! /bin/sh

# Install VirtualBox guest additions
apt install -y dkms linux-headers-amd64 build-essential
mount /media/cdrom
cd /media/cdrom
sh ./VBoxLinuxAdditions.run
umount /media/cdrom
