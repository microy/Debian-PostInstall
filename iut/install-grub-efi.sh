#! /bin/sh

# Reinstall GRUB EFI
apt install --reinstall grub-efi
grub-install /dev/sda
update-grub
