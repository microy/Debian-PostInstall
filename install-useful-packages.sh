#! /bin/sh

#
# Install useful packages
#

apt update
apt purge -y --force-yes vim-tiny netcat-traditional
apt install  -y --force-yes tree htop vim mtr-tiny netcat-openbsd
