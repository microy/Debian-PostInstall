#! /bin/sh

#
# Remove persistent network interface in udev
#

# Remove previous network interfaces detected in udev
rm -fv /etc/udev/rules.d/70-persistent-net.rules

# Create an empty rule for the persistent net generator
: > /etc/udev/rules.d/75-persistent-net-generator.rules
