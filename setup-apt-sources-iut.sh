#! /bin/sh

#
# Setup apt sources (IUT)
#

# Get the date
DATE=$(date "+%Y%m%d")

# Backup previous configuration file
cp -afv /etc/apt/sources.list /etc/apt/sources.list.backup.$DATE

# Output the new configuration file
echo "# Debian
deb http://10.129.44.50/debian jessie main contrib non-free

# Security
deb http://10.129.44.50/security.debian jessie/updates main contrib non-free

# Updates
deb http://10.129.44.50/debian jessie-updates main contrib non-free

# Backports
deb http://10.129.44.50/debian jessie-backports main contrib non-free" > /etc/apt/sources.list

# Update the package database
apt update
