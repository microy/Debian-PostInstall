# Serveur SNMP

## Installation

Installez les paquets client/serveur SNMP et les MIBs :

	apt install snmp snmpd snmp-mibs-downloader

## Configuration

	# Load MIBs by default
	sed -i 's:export MIBS=:export MIBS=/usr/share/mibs:' /etc/default/snmpd
	sed -i 's/:mibs/#:mibs/' /etc/snmp/snmp.conf

Fichier de configuration du serveur `/etc/snmp/snmpd.conf` :

	#
	# SNMP Server Configuration
	#

	# Listen for connections on all interfaces (both IPv4 *and* IPv6)
	agentAddress udp:161,udp6:[::1]:161

	# Full access for all
	rocommunity public

	# Process Monitoring
	proc  mountd
	proc  ntalkd    4
	proc  sendmail 10 1

	# Disk Monitoring
	includeAllDisks  10%

	# System Load
	load   12 10 5

	# Active monitoring
	trapsink     localhost public

	# Run as an AgentX master agent
	master          agentx


## Lancement

Redémarrez le service snmp :

	systemctl restart snmpd
