# Serveur Syslog-ng

## Installation

Installez le paquet du serveur `syslog-ng` :

	apt-get install syslog-ng

## Configuration

Configurez le serveur `syslog-ng` pour recevoir des connexions distantes en créant un nouveau fichier de configuration dynamique :

	nano /etc/syslog-ng/conf.d/10external-sources.conf

Écrivez la configuration suivante dans le fichier :

	# Source distante via TCP ou UDP
	source s_external { udp(); tcp(); };

	# Destination dans le répertoire /var/log/external
	destination d_external { file("/var/log/external/${HOST}/${YEAR}/${MONTH}/${DAY}/syslog" create_dirs(yes)); };

	# Activation des logs de sources externes
	log { source(s_external); destination(d_external); };

## Exécution

Redémarrez le service `syslog-ng` pour prendre en compte la nouvelle configuration :

	service syslog-ng restart