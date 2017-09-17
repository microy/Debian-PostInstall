#! /bin/sh

#
# Remove unnecessary applications in Gnome
# Setup Gnome Shell desktop
#

# Remove unwanted applications
apt purge --yes --autoremove gnome-games gnome-contacts gnome-documents gnome-photos \
transmission-common gnome-weather gnome-orca gnome-online-accounts gnome-online-miners \
gnome-calendar gnome-maps gnome-music gnome-sushi polari evolution gnome-dictionary \
cheese rhythmbox totem gnome-getting-started-docs gnome-sound-recorder simple-scan \
gnome-clocks reportbug seahorse gnome-software synaptic gnome-disk-utility gnome-logs \
gnome-characters gnome-color-manager gnome-font-viewer gnome-user-guide gnome-accessibility-themes \
gnome-orca gnome-online-accounts baobab tracker avahi-daemon yelp

# Configure font rendering
ln -sf /usr/share/fontconfig/conf.avail/10-autohint.conf /etc/fonts/conf.d/
ln -sf /usr/share/fontconfig/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d/

# Setup default background
update-alternatives --set desktop-grub /usr/share/desktop-base/joy-theme/grub/grub-16x9.png
update-alternatives --set desktop-background.xml /usr/share/desktop-base/joy-theme/wallpaper/gnome-background.xml
update-alternatives --set desktop-background /usr/share/desktop-base/joy-theme/wallpaper/contents/images/1920x1200.svg
dpkg-reconfigure desktop-base

# Setup Gnome Shell
# FIXME !!!!
#cp -fv config/gnome.conf /usr/share/glib-2.0/schemas/20_desktop-base.gschema.override
#glib-compile-schemas /usr/share/glib-2.0/schemas
