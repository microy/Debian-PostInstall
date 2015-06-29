#! /bin/sh

#
# System addons
#

# Install NTP server
install_ntp()
{
	# Install NTP packages
	apt install -y ntp

	# Configure NTP servers in France
	cp -fv config/ntp.conf.france /etc/ntp.conf

	# Restart NTP service
	systemctl restart ntp
}

# Install SNMP server
install_snmp()
{
	# Install SNMP packages
	apt install -y snmp snmpd snmp-mibs-downloader

	# Configure SNMP service
	sed -i 's:export MIBS=:export MIBS=/usr/share/mibs:' /etc/default/snmpd
	sed -i 's/^agentAddress/#agentAddress/' /etc/snmp/snmpd.conf
	sed -i 's/^ rocommunity/#rocommunity/' /etc/snmp/snmpd.conf
	cat config/snmpd.conf >> /etc/snmp/snmpd.conf

	# Restart SNMP service
	systemctl restart snmpd
}

# Install Syslog-Ng server
install_syslogng()
{
	# Install packages
	apt install -y syslog-ng

	# Configure service for external sources
	cp -fv config/syslog-ng.conf /etc/syslog-ng/conf.d/10external-sources.conf

	# Restart service
	systemctl restart syslog-ng
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
