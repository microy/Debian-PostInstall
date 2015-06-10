#! /bin/sh

#
# Configure Nano
#

# Backup nano configuration file
cp -v /etc/nanorc /etc/nanorc.backup

# Install configuration file syntax highlighting
cp -v conf.nanorc /usr/share/nano/conf.nanorc

# Setup nano to use the syntax highlight for configuration files
echo "
## Configuration files (catch-all syntax)
include \"/usr/share/nano/conf.nanorc\"" >> /etc/nanorc

