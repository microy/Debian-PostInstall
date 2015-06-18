#! /bin/sh

#
# Configure the system banner, and apt sources
#

# Configure system banners
echo 'IUT Réseaux et Télécoms Auxerre
Debian GNU/Linux 8 \\n \\l
' > /etc/issue
echo '
IUT Reseaux et Telecoms Auxerre
Debian GNU/Linux 8
' > /etc/issue.net
: > /etc/motd

# Configure SSH server banner
sed -i 's/^#Banner/Banner/' /etc/ssh/sshd_config

# Setup apt sources to use our local mirror
if whiptail --title "APT setup" --yesno "Use local mirror server ?" --defaultno 10 50; then
	echo '# Debian
	deb http://10.129.44.50/debian jessie main contrib non-free
	# Updates
	deb http://10.129.44.50/debian jessie-updates main contrib non-free
	# Backports
	deb http://10.129.44.50/debian jessie-backports main contrib non-free
	# Security
	deb http://10.129.44.50/security.debian jessie/updates main contrib non-free' > /etc/apt/sources.list
	apt update
fi

# Setup CNTLM for authentication with our local proxy server
if whiptail --title "CNTLM setup" --yesno "Use local proxy server ?" --defaultno 10 50; then
	# Install CNTLM package
	apt update
	apt install -y cntlm
	# Configure CNTLM
	sed -i 's/^Username/#Username/' /etc/cntlm.conf
	sed -i 's/^Domain/#Domain/' /etc/cntlm.conf
	sed -i 's/^Password/#Password/' /etc/cntlm.conf
	sed -i 's/^Proxy/#Proxy/' /etc/cntlm.conf
	echo '
# IUT proxy
Domain    ADAUX
Proxy     192.168.14.125:8080' >> /etc/cntlm.conf
	# Disable CNTLM service
	systemctl stop cntlm
	systemctl disable cntlm
	# Create a script to start the proxy
	echo '#! /bin/sh
	echo -n "Username: "
	read USER
	cntlm -I -u $USER
	export http_proxy=http://127.0.0.1:3128
	export https_proxy=http://127.0.0.1:3128' > /usr/local/bin/proxy-start
	chmod +x /usr/local/bin/proxy-start
	# Create a script to stop the proxy
	echo '#! /bin/sh
	killall cntlm
	unset http_proxy
	unset https_proxy' > /usr/local/bin/proxy-stop
	chmod +x /usr/local/bin/proxy-stop
fi
