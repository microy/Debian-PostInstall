#!/bin/bash

#--
#
# Clean mr-debian-minimal package
#
#--

# Remove previous configuration files
rm -fv temp/mr-debian-minimal.tar.xz

# Clean previous builds
dh_clean

