#! /bin/sh

#
# Configure Gnome Shell
#

# Configure extensions
gsettings set org.gnome.shell enabled-extensions "['apps-menu@gnome-shell-extensions.gcampax.github.com', 'places-menu@gnome-shell-extensions.gcampax.github.com', 'drive-menu@gnome-shell-extensions.gcampax.github.com']"

# Configure favorite apps
gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'gnome-terminal.desktop', 'putty.desktop', 'geany.desktop', 'libreoffice-startcenter.desktop', 'iceweasel.desktop', 'chromium.desktop', 'wireshark.desktop', 'virtualbox.desktop', 'packettracer.desktop']"

# Enable desktop icons
gsettings set org.gnome.desktop.background show-desktop-icons true

# Configure the clock
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.shell.calendar show-weekdate true

# Disable lock screen
gsettings set org.gnome.desktop.screensaver lock-enabled false
#gsettings set org.gnome.desktop.lockdown disable-lock-screen true

# Disable event sounds
gsettings set org.gnome.desktop.sound event-sounds false

# Disable history
gsettings set org.gnome.desktop.privacy remember-app-usage false
gsettings set org.gnome.desktop.privacy remember-recent-files false

# Configure power button to shutdown the machine
gsettings set org.gnome.settings-daemon.plugins.power button-power "shutdown"

# Configure the background
gsettings set org.gnome.desktop.background picture-uri file:///usr/share/images/desktop-base/joy.xml
gsettings set org.gnome.desktop.screensaver picture-uri file:///usr/share/images/desktop-base/joy.xml

# Get rid of the language menu
gesettings set org.gnome.desktop.input-sources [('xkb', 'fr+latin9')]

# Remove unnecessary folders
rmdir -v ~/Documents
rmdir -v ~/Images
rmdir -v ~/Modèles
rmdir -v ~/Musique
rmdir -v ~/Public
rmdir -v ~/Téléchargements
rmdir -v ~/Vidéos
: > ~/.config/gtk-3.0/bookmarks

# TODO
# Disable tracker, event sounds

# Reload Gnome Shell
gnome-shell --replace &
