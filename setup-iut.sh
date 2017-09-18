#! /bin/sh

#
# Configure system banners, and apt sources
#

# Configure system banners
cp -fv config-iut/issue /etc/issue
cp -fv config-iut/issue.net /etc/issue.net
rm -fv /etc/motd
# Setup apt sources to use our local mirror
if whiptail --title "APT setup" --yesno "Use local APT mirror server ?" --defaultno 10 50; then
	# Configure APT sources
	cp -fv config-iut/sources.list /etc/apt/sources.list
	# Update package database
	apt update
fi
# Setup NTP client to use our local time server
if whiptail --title "NTP setup" --yesno "Use local time server ?" --defaultno 10 50; then
	sed -i 's/^NTP=*/#NTP=*/' /etc/systemd/timesyncd.conf
	echo "NTP=192.168.5.5" >> /etc/systemd/timesyncd.conf
	timedatectl set-ntp true
	systemctl restart systemd-timesyncd.service
	systemctl status systemd-timesyncd.service
	timedatectl status
fi
# Setup CNTLM for authentication with our local proxy server
if whiptail --title "CNTLM setup" --yesno "Use local proxy server ?" --defaultno 10 50; then
	# Install CNTLM package
	apt install -y cntlm
	# Disable CNTLM service
	systemctl stop cntlm
	systemctl disable cntlm
	# Configure CNTLM
	cp -fv config-iut/cntlm.conf /etc/cntlm.conf
	# Copy the scripts to start and stop the local proxy
	cp -fv config-iut/proxy-start /usr/local/sbin/
	cp -fv config-iut/proxy-stop /usr/local/sbin/
fi
# Setup Gnome
if whiptail --title "Gnome setup" --yesno "Configure Gnome for IUT ?" --defaultno 10 50; then
	# Copy the IUT wallpaper
	cp -fv config-iut/rt_wallpaper_2013.png /usr/share/wallpapers/
	# Make the necessary directories for dconf
	mkdir -p /etc/dconf/profile
	mkdir -p /etc/dconf/db/local.d/locks
	# Create the dconf user profile
	echo 'user-db:user
	system-db:local' > /etc/dconf/profile/user
	# Setup Gnome settings for IUT
	cp -fv config-iut/gnome-iut.conf /etc/dconf/db/local.d/
	# Lockdown Gnome settings
	cp -fv config-iut/gnome-iut-locks.conf /etc/dconf/db/local.d/locks/
	# Update dconf
	dconf update
fi
