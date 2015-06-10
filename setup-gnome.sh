#! /bin/sh

#
# Configure Gnome Shell
#

# Configure extensions
gsettings set org.gnome.shell enabled-extensions "['alternative-status-menu@gnome-shell-extensions.gcampax.github.com', 'apps-menu@gnome-shell-extensions.gcampax.github.com', 'places-menu@gnome-shell-extensions.gcampax.github.com', 'drive-menu@gnome-shell-extensions.gcampax.github.com']"

# Configure favorite apps
gsettings set org.gnome.shell favorite-apps "['iceweasel.desktop', 'libreoffice-writer.desktop', 'org.gnome.Nautilus.desktop', 'gnome-terminal.desktop']"

# Enable desktop icons
gsettings set org.gnome.desktop.background show-desktop-icons true

# Configure the clock
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.shell.calendar show-weekdate true

# Disable lock screen
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.lockdown disable-lock-screen true

# Disable event sounds
gsettings set org.gnome.desktop.sound event-sounds false

# Disable history
gsettings set org.gnome.desktop.privacy remember-app-usage false
gsettings set org.gnome.desktop.privacy remember-recent-files false

# Configure power button to shutdown the machine
gsettings set org.gnome.settings-daemon.plugins.power button-power "shutdown"

# Configure the background
org.gnome.desktop.background picture-option zoom
org.gnome.desktop.background picture-uri file:///usr/share/images/desktop-base/joy.xml
org.gnome.desktop.background primary-color #0099cc
org.gnome.desktop.background secondary-color #006699
org.gnome.desktop.screensaver picture-option zoom
org.gnome.desktop.screensaver picture-uri file:///usr/share/images/desktop-base/joy.xml
org.gnome.desktop.screensaver primary-color #0099cc
org.gnome.desktop.screensaver secondary-color #006699

# Reload Gnome Shell
gnome-shell --replace &
