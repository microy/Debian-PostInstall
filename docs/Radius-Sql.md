# Serveur RADIUS avec base de données MySQL

## Installation du serveur RADIUS

Installez le serveur FreeRADIUS avec le support de MySQL, et les utilitaires de test :

	apt-get install freeradius freeradius-mysql freeradius-utils

Note : le mot de passe par défaut du client RADIUS local est `testing123`. En production, ce mot de passe doit être changé. Pour cela, modifiez la configuration du client local (`localhost`) dans le fichier `/etc/freeradius/clients.conf`.

## Installation de la base de données MySQL

Installez le serveur MySQL :

	apt-get install mysql-server

Configurez le mot de passe `rootpass` pendant l'installation. Ce mot de passe sera utilisé pour la connection administrateur `root` à la base de données MySQL.

## Configuration de la base de données MySQL

Connectez-vous à la base de données :

	mysql -u root -p

Créez une base de données nommée `radius` :

	CREATE DATABASE radius;

Attribuez les droits à l'utilisateur `radius` avec le mot de passe `radiuspass` :

	GRANT ALL ON radius.* TO radius@localhost IDENTIFIED BY "radiuspass";

Sélectionnez la base de données `radius` :

	USE radius;

Importez les tables par défaut du serveur RADIUS :

	SOURCE /etc/freeradius/sql/mysql/schema.sql

Importez la table par défaut pour les NAS (Network Access Server) :

	SOURCE /etc/freeradius/sql/mysql/nas.sql

Affichez les tables créés dans la base de données :

	SHOW TABLES;

Quittez la base de données :

	EXIT

## Configuration du serveur RADIUS

Modifiez le fichier de configuration de FreeRADIUS :

	nano /etc/freeradius/radiusd.conf

Activez l'utilisation de la base de données MySQL :

	modules {
		...
		$INCLUDE  sql.conf
		...
	}

Modifiez le fichier de configuration du site par défaut :

	nano /etc/freeradius/sites-available/default

Activez l'utilisation de la base de données MySQL :

	authorize {
		...
		sql
		...
	}

	accounting {
		...
		sql
		...
	}

	session {
		...
		sql
		...
	}

	post-auth {
		...
		sql
		...
	}

Modifiez le fichier de configuration de la base de données MySQL :

	nano /etc/freeradius/sql.conf

Configurez les paramètres de connexion à la base de données :

	sql {
		...
		server = "localhost"
		login = "radius"
		password = "radiuspass"
		radius_db = "radius"
		...
	}

Relancez le service RADIUS pour prendre en compte la nouvelle configuration :

	service freeradius restart

## Création d'un utilisateur RADIUS dans la base de données MySQL

Connectez vous à la base de données :

	mysql -u radius -p

Sélectionnez la base de données `radius` :

	USE radius;

Affichez la description des champs de la table `radcheck` contenant les informations des utilisateurs du service RADIUS :

	DESCRIBE radcheck;

Créez un nouvel utilisateur `user1` avec comme mot de passe `user1pass` :

	INSERT INTO radcheck (username, attribute, op, value) VALUES ('user1', 'Password', ':=', 'user1pass');

Note : Le mot de passe est en clair dans la base de données. En production, il convient de chiffrer les mots de passe pour plus de sécurité (avec MD5 par exemple).

Affichez le nouvel utilisateur dans la table `radcheck` :

	SELECT * FROM radcheck;

Créez un nouvel utilisateur `user2` avec comme mot de passe `user2pass` chiffré avec MD5 :

	INSERT INTO radcheck (username, attribute, op, value) VALUES ('user2', 'MD5-Password', ':=', MD5('user2pass'));

Affichez le nouvel utilisateur dans la table `radcheck` :

	SELECT * FROM radcheck;

Mettez à jour le mot de passe de l'utilisateur `user1` pour qu'il soit chiffré avec MD5 :

	UPDATE radcheck SET attribute='MD5-Password', value=MD5('user1pass') WHERE username='user1';

Affichez les utilisateurs RADIUS dans la table `radcheck` :

	SELECT * FROM radcheck;

Quittez la base de données :

	EXIT

Testez le nouvel utilisateur sur le serveur RADIUS local :

	radtest user1 user1pass localhost 0 testing123

## Création d'un client RADIUS

Éditez le fichier de configuration des clients du serveur RADIUS :

	nano /etc/freeradius/clients.conf

Ajoutez le routeur Cisco comme client :

	client router {
		ipaddr   = 10.0.0.254
		secret   = routersecret
		nas_type = cisco
	}

Relancez le service RADIUS pour prendre en compte la nouvelle configuration :

	service freeradius restart
