#! /bin/sh

#
# Setup NTP service for french servers
#

echo "NTP=0.fr.pool.ntp.org 1.fr.pool.ntp.org 2.fr.pool.ntp.org 3.fr.pool.ntp.org" >> /etc/systemd/timesyncd.conf
timedatectl set-ntp true
systemctl restart systemd-timesyncd.service
systemctl status systemd-timesyncd.service
timedatectl status
