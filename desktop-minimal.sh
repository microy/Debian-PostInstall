#! /bin/sh

# Update packages
apt-get update
apt-get dist-upgrade

apt-get --no-install-recommends install gnome-session-fallback gdm3 xorg gnome-control-center gnome-themes gnome-themes-standard  gnome-terminal desktop-base nautilus nautilus-open-terminal gvfs-backends gnome-applets gnome-system-monitor gnome-screenshot anacron file-roller gnome-screensaver gksu  gstreamer0.10-gnomevfs gstreamer0.10-ffmpeg geany evince libreoffice libreoffice-gnome libreoffice-l10n-fr hyphen-fr mtr-tiny wireshark netstat-nat ttf-mscorefonts-installer vlc gparted gip iperf netcat-openbsd ipcalc tshark flashplugin-nonfree minicom cutecom gtkterm putty gedit eog gstreamer0.10-plugins-ugly

apt-get purge reportbug
rm -f /usr/share/applications/dconf-editor.desktop

cd /tmp

# Install Ubuntu Humanity icon theme
wget http://fr.archive.ubuntu.com/ubuntu/pool/main/h/humanity-icon-theme/humanity-icon-theme_0.6.4_all.deb
dpkg -i humanity-icon-theme_0.6.4_all.deb
rm humanity-icon-theme_0.6.4_all.deb

# Cleanup
apt-get autoremove
apt-get clean
apt-get clean all

# Configuration
dpkg-reconfigure wireshark-common
addgroup etudiant wireshark
addgroup etudiant vboxusers

# Fix gksu
# User
#gconftool --set /apps/gksu/sudo-mode -t bool true
# Global
gconftool-2 --direct --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults --set /apps/gksu/sudo-mode -t bool true
# Autre solution
update-alternatives --set libgksu-gconf-defaults /usr/share/libgksu/debian/gconf-defaults.libgksu-sudo
update-gconf-defaults


