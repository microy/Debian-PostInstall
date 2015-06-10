#! /bin/sh -e

#
# Restaure une machine virtuelle
# avec snapshot de l'état originel
#

# Vérifie les paramètres de la commande
if [ -z "$1" ]; then
	echo "Usage : vm-restore nom_machine_virtuelle"
	exit 1
fi

# Vérifie l'utilisateur
if [ "`id -u`" -eq 0 ]; then
	echo "N'utilisez pas cette commande en root..."
	exit 1
fi

# Restauration du snapshot original
VBoxManage snapshot "$1" restore Original

# Suppression du snapshot étudiant
VBoxManage snapshot "$1" delete Etudiant

# Création du nouveau snapshot étudiant
VBoxManage snapshot "$1" take Etudiant

