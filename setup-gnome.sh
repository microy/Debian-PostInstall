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
gnome-online-miners gnome-accessibility-themes dconf-editor avahi-daemon \
gnome-color-manager gnome-online-accounts caribou

# Remove orphan packages (twice)
deborphan | sudo xargs apt purge -y
deborphan | sudo xargs apt purge -y

# Fix meta-package dependencies
aptitude update

# Install useful applications
apt install -y gip wireshark putty ttf-mscorefonts-installer flashplugin-nonfree \
geany gparted vlc virtualbox chromium chromium-l10n

# Add desktop file with mime info for Cisco Packet Tracer
cp config/packettracer.desktop /usr/share/applications/
update-desktop-database

# Setup Gnome Shell
cp -fv config/gnome.conf /usr/share/glib-2.0/schemas/20_desktop-base.gschema.override
glib-compile-schemas /usr/share/glib-2.0/schemas

# Configure PuTTY default settings
mkdir -p /etc/skel/.putty/sessions
cp -fv config/putty.conf /etc/skel/.putty/sessions/Default%20Settings
for USER in $(ls /home); do
	if [ "$USER" = 'lost+found' ]; then continue; fi
	cp -Rfv /etc/skel/.putty /home/$USER/
	chown -R $USER:$USER /home/$USER/.putty
done

