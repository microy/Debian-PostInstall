#! /bin/sh -e

#
# Importe une machine virtuelle
# et créer un snapshot de l'état originel
#

# Vérifie les paramètres de la commande
if [ -z "$1" ]; then
	echo "Usage : vm-import nom_machine_virtuelle"
	exit 1
fi

# Vérifie l'utilisateur
if [ "`id -u`" -eq 0 ]; then
	echo "N'utilisez pas cette commande en root..."
	exit 1
fi

# Importation de la machine virtuelle
VBoxManage import /virtualbox/etudiant/"$1".ova

# Création du snapshot original
VBoxManage snapshot "$1" take Original

# Création du snapshot étudiant
VBoxManage snapshot "$1" take Etudiant
