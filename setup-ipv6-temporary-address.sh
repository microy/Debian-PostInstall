#! /bin/sh

#
# Configure IPv6 temporary address on all network interfaces
#

INTERFACES=$(ip -o link show | awk -F"[ :]+" '{print $2}')
echo '# Activate IPv6 temporary address
net.ipv6.conf.default.use_tempaddr = 2
net.ipv6.conf.all.use_tempaddr = 2' > /etc/sysctl.d/local.conf
for i in $INTERFACES; do
	if [ "$i" = 'lo' ]; then continue; fi
	echo "net.ipv6.conf.$i.use_tempaddr = 2" >> /etc/sysctl.d/local.conf
done
sysctl --system
