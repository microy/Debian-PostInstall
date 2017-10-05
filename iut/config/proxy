
# Start the proxy
function proxy-start
{
	# Declare local variables
	local proxy_user=""
	local proxy_password=""
	# Read proxy username
	echo "Proxy authentication..."
	echo -n "Username: "
	read proxy_user
	# Read proxy password
	echo -n "Password: "
	read -s proxy_password
	# Start CNTLM service
	echo "Launch the proxy (may need sudo authentication)..."
	sudo cntlm -u $proxy_user -p $proxy_password -d ADAUX 192.168.14.125:8080
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
