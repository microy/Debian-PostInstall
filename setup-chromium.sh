#! /bin/sh

#
# Add proxy parameters to google chrome desktop file
# $1 : proxy url (adresse:port)
#

sed -i 's:/usr/bin/chromium:/usr/bin/chromium --proxy-server=192.168.14.125:' /usr/share/applications/chromium.desktop
