#! /bin/sh

#
# Remove unnecessary applications in Gnome
# Install some useful applications
# Setup Gnome Shell desktop
#

# Remove unwanted applications
#apt purge evolution empathy cheese gnome-maps gnome-mahjongg gnome-games \
#gnome-sudoku gnome-tetravex gnome-chess gnome-dictionary gnome-orca polari \
#transmission-common simple-scan rhythmbox rhythmbox-data gnome-clocks \
#hamster-applet gnome-photos gnome-music totem-common gnome-getting-started-docs \
#gnome-sound-recorder gnome-user-guide gnome-contacts gnome-documents gnome-mines \
#gnome-klotski gnome-robots gnome-nibbles aisleriot five-or-more four-in-a-row \
#iagno quadrapassel hitori swell-foop tali xboard lightsoff gnome-packagekit-data \
#gnome-font-viewer gnome-logs gnome-disk-utility gnome-shell-extension-weather \
#bijiben tracker reportbug gnome-nettool yelp baobab gnome-system-log seahorse \
#gnome-online-miners gnome-accessibility-themes dconf-editor avahi-daemon \
#gnome-color-manager gnome-online-accounts caribou rygel zeitgeist-core

apt purge --yes --autoremove gnome-games gnome-contacts gnome-documents gnome-photos \
transmission-common gnome-weather gnome-orca gnome-online-accounts gnome-online-miners \
gnome-calendar gnome-maps gnome-music gnome-sushi polari evolution gnome-dictionary \
cheese rhythmbox totem gnome-getting-started-docs gnome-sound-recorder simple-scan \
gnome-clocks reportbug seahorse gnome-software synaptic gnome-disk-utility gnome-logs \
gnome-characters gnome-color-manager gnome-font-viewer gnome-user-guide gnome-accessibility-themes \
gnome-orca gnome-online-accounts gnome-online-miners baobab


# Install useful applications
apt install --yes libreoffice vlc

#apt install -y gip wireshark ttf-mscorefonts-installer flashplugin-nonfree \
#geany gparted vlc virtualbox numlockx firefox-esr firefox-esr-l10n-fr

# Configure font rendering
ln -sf /usr/share/fontconfig/conf.avail/10-autohint.conf /etc/fonts/conf.d/
ln -sf /usr/share/fontconfig/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d/
ln -sf /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/

# Setup default background
update-alternatives --set desktop-grub /usr/share/images/desktop-base/joy-grub.png
update-alternatives --set desktop-background.xml /usr/share/images/desktop-base/joy.xml
update-alternatives --set desktop-background /usr/share/images/desktop-base/joy-wallpaper_1920x1200.svg
dpkg-reconfigure desktop-base

# Setup Gnome Shell
# FIXME !!!!
cp -fv config/gnome.conf /usr/share/glib-2.0/schemas/20_desktop-base.gschema.override
glib-compile-schemas /usr/share/glib-2.0/schemas

# Download and install Atom
./config/update-atom

# Add script to update Atom
cp -fv config/update-atom /usr/local/sbin/

# Download and install Google Chrome
./config/update-chrome

# Add script to update Atom
cp -fv config/update-chrome /usr/local/sbin/
