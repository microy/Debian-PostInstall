#! /bin/sh -e

#
# Supprime une machine virtuelle
#

# Vérifie les paramètres de la commande
if [ -z "$1" ]; then
	echo "Usage : vm-delete nom_machine_virtuelle"
	exit 1
fi

# Vérifie l'utilisateur
if [ "`id -u`" -eq 0 ]; then
	echo "N'utilisez pas cette commande en root..."
	exit 1
fi

# Suppression du snapshot étudiant
VBoxManage snapshot "$1" delete Etudiant

# Suppression du snapshot original
VBoxManage snapshot "$1" delete Original

# Suppression de la machine virtuelle
VBoxManage unregistervm "$1" --delete

