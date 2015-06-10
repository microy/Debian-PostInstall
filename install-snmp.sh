#! /bin/sh

#
# Install and configure SNMP service
#

# Install SNMP packages
apt-get update
apt-get install -y --force-yes snmp snmpd snmp-mibs-downloader

# Configure SNMP service
sed -i 's:export MIBS=:export MIBS=/usr/share/mibs:' /etc/default/snmpd
sed -i 's/agentAddress  udp:127/#agentAddress udp:127/' /etc/snmp/snmpd.conf
sed -i 's/#agentAddress udp:161/agentAddress  udp:161/' /etc/snmp/snmpd.conf
sed -i 's/ rocommunity/#rocommunity/' /etc/snmp/snmpd.conf
sed -i '/#rocommunity public  localhost/ a\
                                                 #  Full access for all\
 rocommunity public' /etc/snmp/snmpd.conf

# Restart SNMP service
service snmpd restart

