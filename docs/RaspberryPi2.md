# Raspberry Pi 2

## Installation du système

Téléchargement de l'image système :

	http://www.raspberrypi.org/downloads/

Copie du système sur la carte SD `/dev/sdX` :

	dd bs=4M if=raspbian.img of=/dev/sdX; sync

## Configuration du système

Mise à jour du système :

	apt-get update
	apt-get dist-upgrade

Mise à jour du firmware :

	rpi-update

Configuration du système :

	raspi-config
		
Initialisation des clés SSH :

	rm -fv /etc/ssh/ssh_host_*
	dpkg-reconfigure openssh-server

Configuration de BASH :

	mv /etc/bash.bashrc /etc/bash.bashrc.backup
	nano /etc/bash.bashrc
	mv /etc/skel/.bashrc /etc/skel/.bashrc.backup
	mv /root/.bashrc /root/.bashrc.backup
	
Configuration des messages à la connexion :

	nano /etc/issue
	nano /etc/issue.net
	: > /etc/motd
	
Création d'un compte utilisateur `etudiant` :

	adduser etudiant
	adduser etudiant sudo
	adduser etudiant adm
	adduser etudiant dialout
	adduser etudiant cdrom
	adduser etudiant audio
	adduser etudiant video
	adduser etudiant plugdev
	adduser etudiant games
	adduser etudiant users
	adduser etudiant netdev
	adduser etudiant input
	adduser etudiant spi
	adduser etudiant gpio

Suppression du compte utilisateur `pi` après reconnexion avec le compte `etudiant` :

	deluser --remove-all-files pi

Redémarrage du système :

	reboot
