#! /bin/sh

#
# Remove unnecessary applications in Gnome
# Install some useful applications
# Setup Gnome Shell desktop
#

# Remove unwanted applications
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

# Install useful applications
apt install -y gip wireshark putty ttf-mscorefonts-installer flashplugin-nonfree \
geany gparted vlc virtualbox chromium chromium-l10n

# Add desktop file with mime info for Cisco Packet Tracer
cp packettracer.desktop /usr/share/applications/
update-desktop-database

# Setup Gnome Shell
cp -fv 20_desktop-base.gschema.override /usr/share/glib-2.0/schemas/
glib-compile-schemas /usr/share/glib-2.0/schemas

# Configure PuTTY default settings
mkdir -p /etc/skel/.putty/sessions
cp -fv putty.conf /etc/skel/.putty/sessions/

