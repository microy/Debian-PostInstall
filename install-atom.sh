#! /bin/sh

# Download Atom
wget -O /tmp/atom.deb https://atom.io/download/deb
# Install Atom
dpkg -i /tmp/atom.deb
apt -f -y install
