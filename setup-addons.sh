#! /bin/sh

#
# System addons
#

# Install NTP server
install_ntp()
{

	# Install NTP packages
	apt install -y ntp

	# Configure NTP servers for France
	sed -i 's/.debian./.fr./' /etc/ntp.conf

	# Restart NTP service
	service ntp restart

}

# Install SNMP server
install_snmp()
{

	# Install SNMP packages
	apt install -y snmp snmpd snmp-mibs-downloader

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

}

# Install Syslog-Ng server
install_syslogng()
{

	# Install packages
	apt install -y syslog-ng

	# Configure service for external sources
	echo '# External sources
	source s_external      { udp(); tcp(); };
	destination d_external { file("/var/log/external/${HOST}/${YEAR}/${MONTH}/${DAY}/syslog" create_dirs(yes)); };
	log                    { source(s_external); destination(d_external); };' > /etc/syslog-ng/conf.d/10external-sources.conf

	# Restart service
	service syslog-ng restart

}

# Choose what service to install
ADDONS=$(whiptail --title "System addon setup" --separate-output --checklist \
"Choose additionnal services to install :" 20 78 4 \
"NTP" "Time service" OFF \
"SNMP" "Monitoring service" OFF \
"SYSLOG-NG" "System logging service" OFF 3>&1 1>&2 2>&3)

# Install selected services
for SERVICE in $ADDONS; do
	case $SERVICE in
		NTP) install_ntp
		;;
		SNMP) install_snmp
		;;
		SYSLOG-NG) install_syslogng
		;;
	esac
done
