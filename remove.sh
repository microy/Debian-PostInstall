#! /bin/bash

#
# Remove the post-installation configuration
#

# Restore previous configuration files
. /config-restore.sh

# Delete installation directory
rm -Rfv `cat installdir`
