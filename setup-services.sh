#! /bin/sh

#
# System services
#

# Install SSH server
install_ssh()
{
	# Install SSH packages
	apt install -y openssh-server
}
# Install SNMP server
install_snmp()
{
	# Install SNMP packages
	apt install -y snmp snmpd snmp-mibs-downloader
	# Load MIBs by default
	sed -i 's:export MIBS=:export MIBS=/usr/share/mibs:' /etc/default/snmpd
	sed -i 's/:mibs/#:mibs/' /etc/snmp/snmp.conf
	# SNMP server configuration
	cp -fv config/snmpd.conf /etc/snmp/snmpd.conf
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
# Choose what services to install
SERVICES=$(whiptail --title "System services setup" --separate-output --checklist \
"Choose additionnal services to install :" 20 78 4 \
"SSH" "Secure Shell service" OFF \
"SNMP" "Monitoring service" OFF \
"SYSLOG-NG" "System logging service" OFF 3>&1 1>&2 2>&3)
# Install selected services
for SERVICE in $SERVICES; do
	case $SERVICE in
		SSH) install_ssh
		;;
		SNMP) install_snmp
		;;
		SYSLOG-NG) install_syslogng
		;;
	esac
done
