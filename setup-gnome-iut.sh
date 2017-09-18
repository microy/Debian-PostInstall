#! /bin/sh

#
# Copy our wallpaper
# Lockdown some Gnome settings
#

# Copy the IUT wallpaper
cp -fv config-iut/rt_wallpaper_2013.png /usr/share/wallpapers/

# Make the necessary directories for dconf
mkdir -p /etc/dconf/profile
mkdir -p /etc/dconf/db/local.d/locks

# Create the dconf user profile
echo 'user-db:user
system-db:local' > /etc/dconf/profile/user

# Setup Gnome
cp -fv config-iut/gnome-iut.conf /etc/dconf/db/local.d/

# Lockdown settings
cp -fv config-iut/gnome-iut-locks.conf /etc/dconf/db/local.d/locks/

# Update dconf
dconf update
