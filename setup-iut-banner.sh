#! /bin/sh

#
# Configure the system banners
#

# Backup previous banners
cp -fv /etc/issue /etc/issue.backup
cp -fv /etc/issue.net /etc/issue.net.backup
cp -fv /etc/motd /etc/motd.backup

# Configure the new banners
echo 'IUT Réseaux et Télécoms Auxerre
Debian GNU/Linux 8 \\n \\l
' > /etc/issue
cp -fv /etc/issue /etc/issue.net
: > /etc/motd


