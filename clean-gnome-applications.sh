#! /bin/sh

#
# Remove unnecessary applications in Gnome
#

apt purge evolution empathy cheese gnome-maps gnome-mahjongg gnome-games \
gnome-sudoku gnome-tetravex gnome-chess gnome-dictionary gnome-orca polari \
transmission-common simple-scan rhythmbox rhythmbox-data gnome-clocks \
hamster-applet gnome-photos gnome-music totem-common gnome-getting-started-docs \
gnome-sound-recorder gnome-user-guide gnome-contacts gnome-documents gnome-mines \
gnome-klotski gnome-robots gnome-nibbles aisleriot five-or-more four-in-a-row \
iagno quadrapassel hitori swell-foop tali xboard lightsoff gnome-packagekit-data \
gnome-font-viewer gnome-logs gnome-disk-utility gnome-shell-extension-weather \
bijiben tracker reportbug gnome-nettool yelp baobab gnome-system-log seahorse \
gnome-online-miners gnome-accessibility-themes alacarte dconf-editor avahi-daemon \
librygel-core-2.4-2

# Fix meta-package dependencies
aptitude update

# Remove orphan packages
deborphan | sudo xargs apt purge -y
