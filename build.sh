#!/bin/bash

#--
#
# Build mr-debian-minimal package
#
#--

# Remove previous files
./clean.sh

# Package new configuration files
cd data
tar cvfpJ ../temp/mr-debian-minimal.tar.xz *
cd ..

# Build new package
dpkg-buildpackage -us -uc
