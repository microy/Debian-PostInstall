#! /bin/sh

#
# Remove unnecessary applications in Gnome
# Setup Gnome Shell desktop
# Install some useful applications
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
apt install -y gip wireshark putty ttf-mscorefonts-installer \
flashplugin-nonfree geany gparted vlc virtualbox chromium chromium-l10n

# Add desktop file with mime info for Cisco Packet Tracer
echo '[Desktop Entry]
Version=1.0
Type=Application
Name=Cisco Packet Tracer
Comment=Network simulation tool
GenericName=Cisco Packet Tracer
Exec=/opt/pt/packettracer
Icon=/opt/pt/art/app.png
Categories=GTK;Network;
StartupNotify=true
Terminal=false
MimeType=application/x-pkt;application/x-pka;application/x-pkz;' > /usr/share/applications/packettracer.desktop
update-desktop-database

# Setup Gnome Shell
echo '[org.gnome.desktop.background]
show-desktop-icons true
picture-uri file:///usr/share/images/desktop-base/joy.xml
[org.gnome.shell]
enabled-extensions "[\'apps-menu@gnome-shell-extensions.gcampax.github.com\', \'places-menu@gnome-shell-extensions.gcampax.github.com\', \'drive-menu@gnome-shell-extensions.gcampax.github.com\']"
favorite-apps "[\'org.gnome.Nautilus.desktop\', \'gnome-terminal.desktop\', \'putty.desktop\', \'geany.desktop\', \'libreoffice-startcenter.desktop\', \'iceweasel.desktop\', \'chromium.desktop\', \'wireshark.desktop\', \'virtualbox.desktop\', \'packettracer.desktop\']"
[org.gnome.desktop.interface]
clock-show-date true
[org.gnome.desktop.screensaver]
lock-enabled false
picture-uri file:///usr/share/images/desktop-base/joy.xml
[org.gnome.shell.calendar]
show-weekdate true
[org.gnome.desktop.sound]
event-sounds false
[org.gnome.settings-daemon.plugins.power]
button-power "shutdown"
[org.gnome.desktop.input-sources]
[(\'xkb\', \'fr+latin9\')]
#[org.gnome.desktop.privacy]
#remember-app-usage false
#remember-recent-files false
#[org.gnome.desktop.lockdown]
#disable-lock-screen true' > /usr/share/glib-2.0/schemas/20_desktop-base.gschema.override
glib-compile-schemas /usr/share/glib-2.0/schemas


# Configure PuTTY default settings
mkdir -p /etc/skel/.putty/sessions
echo 'ScrollbackLines=20000
TermWidth=120
TermHeight=35
FontName=client:Monospace 12
Colour0=0,0,0
Colour1=85,85,85
Colour2=255,255,255
Colour3=187,187,187
Colour4=0,0,0
Colour5=0,0,0' > /etc/skel/.putty/sessions/putty.conf

