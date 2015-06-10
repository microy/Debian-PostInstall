#! /bin/sh

#
# Zero GRUB timeout
#

# Change the GRUB timeout in the configuration file
sed -i 's/GRUB_TIMEOUT=.*/GRUB_TIMEOUT=0/' /etc/default/grub

# Update GRUB
update-grub
