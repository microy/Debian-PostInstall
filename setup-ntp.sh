#! /bin/sh

#
# Setup NTP service for french servers
#

# Remove previous serveur configuration
sed -i 's/^NTP=*/#NTP=*/' /etc/systemd/timesyncd.conf
# Add the french NTP servers
echo "NTP=0.fr.pool.ntp.org 1.fr.pool.ntp.org 2.fr.pool.ntp.org 3.fr.pool.ntp.org" >> /etc/systemd/timesyncd.conf
# Use the NTP server
timedatectl set-ntp true
# Restart the NTP client service
systemctl restart systemd-timesyncd.service
