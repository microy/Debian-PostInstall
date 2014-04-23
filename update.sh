#! /bin/bash

#
# Update the post-installation configuration
#

# Restore previous configuration files
if [ -d backup ]; then
	source remove.sh
fi

# Install new configuration files
source install.h
