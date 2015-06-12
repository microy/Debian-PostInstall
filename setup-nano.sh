#! /bin/sh

#
# Configure Nano
#

# Get the date
DATE=$(date "+%Y%m%d")

# Backup nano configuration file
cp -fv /etc/nanorc /etc/nanorc.backup.$DATE

# Install configuration file syntax highlighting
cp -fv conf.nanorc /usr/share/nano/conf.nanorc

# Setup nano to use the syntax highlight for configuration files
echo "
## Configuration files (catch-all syntax)
include \"/usr/share/nano/conf.nanorc\"" >> /etc/nanorc

