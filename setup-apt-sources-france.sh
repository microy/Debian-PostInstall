#! /bin/sh

#
# Setup apt sources (France)
#

# Get the date
DATE=$(date "+%Y%m%d")

# Backup previous configuration file
cp -afv /etc/apt/sources.list /etc/apt/sources.list.backup.$DATE

# Output the new configuration file
echo "# Debian
deb http://ftp.fr.debian.org/debian jessie main contrib non-free

# Security
deb http://security.debian.org jessie/updates main contrib non-free

# Updates
deb http://ftp.fr.debian.org/debian jessie-updates main contrib non-free

# Backports
deb http://ftp.fr.debian.org/debian jessie-backports main contrib non-free" > /etc/apt/sources.list

# Update the package database
apt update
