# VirtualBox

## Headless

Installation :

	apt install linux-headers-amd64 dkms
	apt install -t jessie-backports --no-install-recommends virtualbox

Installation du pack d'extension :

	VBoxManage extpack install /tmp/Oracle_VM_VirtualBox_Extension_Pack-5.0.20-106931.vbox-extpack

Ajout de l'utilisateur au groupe VirtualBox :

	adduser mroy vboxusers

Configuration du répertoire par défaut pour les VM :

	mkdir VirtualBox
	VBoxManage setproperty machinefolder /home/mroy/VirtualBox/

Importation d'une VM

	VBoxManage import ma_vm.ova

Démarrage d'une VM

	VBoxManage startvm ma_vm --type headless

Arrêt d'une VM

	VBoxManage controlvm ma_vm acpipowerbutton

