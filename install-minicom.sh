#! /bin/sh

# Install minicom
apt -y -t stretch-backports install minicom
# Setup minicom
echo 'pu port             /dev/ttyS0
pu baudrate         9600
pu bits             8
pu parity           N
pu stopbits         1' > /etc/minicom/minirc.dfl
