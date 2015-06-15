#! /bin/sh

#
# Configure the system for the Auxerre Institute of Technology
#

# Backup previous banners
cp -afv /etc/issue /etc/issue.$(date "+%Y%m%d")
cp -afv /etc/issue.net /etc/issue.net.$(date "+%Y%m%d")
cp -afv /etc/motd /etc/motd.$(date "+%Y%m%d")

# Configure the new banners
echo 'IUT Réseaux et Télécoms Auxerre
Debian GNU/Linux 8 \\n \\l
' > /etc/issue
cp -fv /etc/issue /etc/issue.net
: > /etc/motd

# Setup apt sources to use our local mirror
cp -afv /etc/apt/sources.list /etc/apt/sources.list.$(date "+%Y%m%d")
echo '# Debian
deb http://10.129.44.50/debian jessie main contrib non-free
# Updates
deb http://10.129.44.50/debian jessie-updates main contrib non-free
# Backports
deb http://10.129.44.50/debian jessie-backports main contrib non-free
# Security
deb http://10.129.44.50/security.debian jessie/updates main contrib non-free' > /etc/apt/sources.list
apt update
