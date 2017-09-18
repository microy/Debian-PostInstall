# Commandes Linux utiles


## Supprime les fichiers de backup `~`

	find . -type f -name '*~' -print -delete

## Supprime les baux du client DHCP

	rm -fv /var/lib/dhcp/dhclient*

## Supprime les fichiers de log

	find /var/log -type f  -print -delete
	: > /var/log/btmp
	: > /var/log/wtmp

## Régénère les clés SSH de la machine

	rm -fv /etc/ssh/ssh_host_*
	dpkg-reconfigure openssh-server

## Ajouter 1h au timestamp des images

	exiftool -AllDates+=1 *.JPG

## Renommez les images en fonction du timestamp

	exiftool -d %Y%m%d_%H%M%S%%-c.%%e "-testname<CreateDate" .
	exiftool -d %Y%m%d_%H%M%S%%-c.jpg "-testname<CreateDate" *.JPG
	exiftool -d %Y%m%d_%H%M%S%%-c.jpg "-filename<CreateDate" *.JPG

	jhead -n%Y%m%d-%H%M%S *.jpg 

