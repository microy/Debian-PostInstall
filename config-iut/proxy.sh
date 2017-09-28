#! /bin/sh

# Start the proxy
function proxy-start
{
	# Read proxy username
	echo "Proxy authentication"
	echo -n "Username: "
	read PROXY_USER
	# Start CNTLM service
	sudo cntlm -I -u $PROXY_USER -d ADAUX 192.168.14.125:8080
	# Export proxy configuration
	export http_proxy=http://127.0.0.1:3128
	export https_proxy=http://127.0.0.1:3128
	export HTTP_PROXY=http://127.0.0.1:3128
	export HTTPS_PROXY=http://127.0.0.1:3128
}

# Stop the proxy
function proxy-stop
{
	# Stop CNTLM service
	sudo kill -9 $(pidof cntlm)
	# Unset proxy configuration
	unset http_proxy https_proxy HTTP_PROXY HTTPS_PROXY
}
