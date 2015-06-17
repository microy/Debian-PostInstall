#! /bin/sh

#
# Configure the system banner, and apt sources
#

# Configure system banner
echo 'IUT Réseaux et Télécoms Auxerre
Debian GNU/Linux 8 \\n \\l
' > /etc/issue
cp -fv /etc/issue /etc/issue.net
: > /etc/motd

# Setup apt sources to use our local mirror
if whiptail --title "APT setup" --yesno "Use local mirror server ?" --defaultno 10 50; then
	echo '# Debian
	deb http://10.129.44.50/debian jessie main contrib non-free
	# Updates
	deb http://10.129.44.50/debian jessie-updates main contrib non-free
	# Backports
	deb http://10.129.44.50/debian jessie-backports main contrib non-free
	# Security
	deb http://10.129.44.50/security.debian jessie/updates main contrib non-free' > /etc/apt/sources.list
	apt update
fi
