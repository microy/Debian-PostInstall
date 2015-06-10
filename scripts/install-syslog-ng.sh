#! /bin/sh

#
# Install and configure syslog-ng service
#

# Install packages
apt-get update
apt-get install -y --force-yes syslog-ng

# Configure service for external sources
echo '# External sources
source s_external      { udp(); tcp(); };
destination d_external { file("/var/log/external/${HOST}/${YEAR}/${MONTH}/${DAY}/syslog" create_dirs(yes)); };
log                    { source(s_external); destination(d_external); };' > /etc/syslog-ng/conf.d/10external-sources.conf

# Restart service
service syslog-ng restart

