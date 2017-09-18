# Administration des réseaux sous Linux


## Interfaçage

### Affichage des interfaces

	ip [-s] link
	ip link show <interface>

### Activation d'une interface

	ip link set <interface> up

### Désactivation d'une interface

	ip link set <interface> down

### Configuration d'une interface VLAN

	ip link add link <interface_physique> name <interface_vlan> type vlan id <vlan>

### Suppression d'une interface

	ip link del <interface>

### Configuration d'une interface TAP

	ip tuntap add dev <interface_tap> mode tap
	

## Voisinage

### Affichage de la table de voisinage (ARP)

	ip neigh
	ip neigh show <interface>

### Initialisation de la table de voisinage (ARP)

	ip neigh flush <interface>
  

## Adressage

### Affichage des adresses IP

	ip addr
	ip addr show <interface>

### Configuration d'une adresse IP statique

	ip addr add <adresse>/<masque> dev <interface>

### Suppression d'une adresse IP

	ip addr del <adresse>/<masque> dev <interface>

### Configuration d'une adresse IP dynamique (client DHCP)

	dhclient [-v] <interface>

### Suppression de toutes les adresses d'une interface

	ip addr flush <interface>


## Routage

### Affichage de la table de routage

	ip [-6] route

### Activation du routage

	sysctl -w net.ipv4.ip_forward=1

### Configuration d'une route statique

	ip route add <adresse>/<masque> via <passerelle>

### Suppression d'une route statique

	ip route del <adresse>/<masque> via <passerelle>

### Configuration de la route par défaut

	ip route add default via <passerelle>

### Suppression de la route par défaut

	ip route del default


## NAT / PAT

### Configuration du NAT / PAT (NAT source dynamique)

	iptables -t nat -A POSTROUTING -o <interface_publique> -j MASQUERADE

### Configuration du transfert de port (NAT destination statique)

	iptables -t nat -A PREROUTING -i <interface_publique> -p <protocole> --dport <port> --to <adresse_serveur> -j DNAT

### Affichage de la table NAT

	iptables -t nat -L -v -n
	
### Affichage des connexions NAT

	netstat-nat -n -N


## IPerf

### Exécution d'un serveur iperf

	iperf -s

### Exécution d'un client iperf

	iperf -c <adresse_serveur>


