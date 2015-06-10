#! /bin/sh

#
# Add proxy parameters to google chrome desktop file
# $1 : proxy url (adresse:port)
#

sed -i 's/google-chrome-stable/google-chrome-stable --proxy-server="$1"/' /usr/share/applications/google-chrome.desktop
