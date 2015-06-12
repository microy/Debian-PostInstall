#! /bin/sh

#
# Configure the system banners
#

# Get the date
DATE=$(date "+%Y%m%d")

# Backup previous banners
cp -afv /etc/issue /etc/issue.backup.$DATE
cp -afv /etc/issue.net /etc/issue.net.backup.$DATE
cp -afv /etc/motd /etc/motd.backup.$DATE

# Configure the new banners
echo 'IUT Réseaux et Télécoms Auxerre
Debian GNU/Linux 8 \\n \\l
' > /etc/issue
cp -fv /etc/issue /etc/issue.net
: > /etc/motd


