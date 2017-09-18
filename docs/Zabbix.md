# Zabbix

## Installation

	apt-get install -t wheezy-backports zabbix-server-mysql zabbix-frontend-php zabbix-agent

## Configuration

	gunzip /usr/share/zabbix-server-mysql/*.gz

	mysql - u root -p
  
	CREATE DATABASE zabbix;
	GRANT ALL ON zabbix.* TO 'zabbix'@'localhost' IDENTIFIED BY 'zabbixpass';
	SOURCE /usr/share/zabbix-server-mysql/schema.sql
	SOURCE /usr/share/zabbix-server-mysql/images.sql
	SOURCE /usr/share/zabbix-server-mysql/data.sql

	vim /etc/zabbix/zabbix_server.conf

	vim /etc/default/zabbix-server
  
	ln -s /usr/share/doc/zabbix-frontend-php/examples/apache.conf /etc/apache2/conf.d/zabbix.conf
  
	vim /etc/apache2/conf.d/zabbix.conf
  
	php_value max_execution_time 300
	php_value memory_limit 128M
	php_value post_max_size 16M
	php_value upload_max_filesize 2M
	php_value max_input_time 300
	php_value date.timezone Europe/Paris
 
	ln -s /usr/share/doc/zabbix-frontend-php/examples/zabbix.conf.php.example /etc/zabbix/zabbix.conf.php
  
	vim /etc/zabbix/zabbix.conf.php
  
  