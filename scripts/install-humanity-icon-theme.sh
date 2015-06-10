#! /bin/sh

#
# Install Ubuntu Humanity icon theme
#

wget http://fr.archive.ubuntu.com/ubuntu/pool/main/h/humanity-icon-theme/humanity-icon-theme_0.6.5_all.deb -O /tmp/humanity-icon-theme.deb
dpkg -i /tmp/humanity-icon-theme.deb
rm -fv /tmp/humanity-icon-theme.deb

