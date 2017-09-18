#! /bin/sh

#
# Configure system banners, and apt sources
#

# Configure system banners
cp -fv config-iut/issue /etc/issue
cp -fv config-iut/issue.net /etc/issue.net
rm -fv /etc/motd

# Select additionnal setup
SETUPIUT=$(whiptail --title "IUT Configuration" --checklist \
"Choose what to setup :" 20 78 4 \
"APT" "Use local APT mirror server" OFF \
"NTP" "Use local NTP time server" OFF \
"CNTLM" "Use local CNTLM proxy server" OFF \
"GNOME" "Configure Gnome for IUT" OFF  3>&1 1>&2 2>&3)

# Setup APT
setup_apt()
{
	# Configure APT sources
	cp -fv config-iut/sources.list /etc/apt/sources.list
	# Update package database
	apt update
}

# Setup NTP client to use our local time server
setup_ntp()
{
	# Remove previous server configuration
	sed -i 's/^NTP=*/#NTP=*/' /etc/systemd/timesyncd.conf
	# Add our own local NTP server
	echo "NTP=192.168.5.5" >> /etc/systemd/timesyncd.conf
	# Use the NTP configuration
	timedatectl set-ntp true
	# Restart the NTP client service
	systemctl restart systemd-timesyncd.service
}

# Setup CNTLM for authentication with our local proxy server
setup_cntlm()
{
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
}

# Setup Gnome
setup_gnome()
{
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
}

# Install selected setups
for SETUP in $SETUPIUT; do
	case $SETUP in
		APT) setup_apt
		;;
		NTP) setup_ntp
		;;
		CNTLM) setup_cntlm
		;;
		GNOME) setup_gnome
		;;
	esac
done
