#!/bin/bash

#--
#
# Clean mr-debian-minimal package
#
#--

# Remove backup files
find . -type f -name '*~' -exec rm -v {} \;

# Remove previous configuration files
rm -fv install/mr-debian-minimal.tar.xz

# Clean previous builds
dh_clean

