#! /bin/sh

#
# Configure Nano
#

# Backup nano configuration file
cp -afv /etc/nanorc /etc/nanorc.$(date "+%Y%m%d")

# Install configuration file syntax highlighting
cp -fv conf.nanorc /usr/share/nano/conf.nanorc

# Setup nano to use the syntax highlight for configuration files
echo "
## Configuration files (catch-all syntax)
include \"/usr/share/nano/conf.nanorc\"" >> /etc/nanorc

