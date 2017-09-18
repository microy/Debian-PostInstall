# Serveur RADIUS

## Installation du serveur RADIUS

Installez le serveur FreeRADIUS, et les utilitaires de test :

	apt-get install freeradius freeradius-utils

Note : le mot de passe par défaut du client RADIUS local est `testing123`. En production, ce mot de passe doit être changé. Pour cela, modifiez la configuration du client local (`localhost`) dans le fichier `/etc/freeradius/clients.conf`.

## Configuration d'un utilisateur local

Modifiez le fichier de configuration des utilisateurs de FreeRADIUS :

	nano /etc/freeradius/users

Créez un nouvel utilisateur `usertest` avec comme mot de passe `usertestpass` :

	usertest Cleartext-Password := "usertestpass"

Note : Le mot de passe est en clair dans le fichier. En production, il convient de chiffrer les mots de passe pour plus de sécurité (avec MD5 par exemple).

Relancez le service RADIUS pour prendre en compte la nouvelle configuration :

	service freeradius restart

Testez l'utilisateur local avec la commande `radtest` :

	radtest usertest usertestpass localhost 0 testing123

## Configuration d'un client RADIUS

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

