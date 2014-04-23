#! /bin/sh

#
# Update the post-installation configuration
#

# Restore previous configuration files
if [ -d backup ]; then
	. ./remove.sh
fi

# Install new configuration files
. ./install.sh
