#! /bin/sh

#
# Configure the system banners
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


