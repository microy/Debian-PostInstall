
# Start proxy
function proxy-start
{
	# Read proxy username
	echo -n "Username: "
	read PROXY_USER

	# Start CNTLM service
	cntlm -I -u $PROXY_USER

	# Export proxy configuration
	export http_proxy=http://127.0.0.1:3128
	export https_proxy=http://127.0.0.1:3128
}

# Stop proxy
function proxy-stop
{
	# Stop CNTLM service
	killall cntlm

	# Unset proxy configuration
	unset http_proxy https_proxy
}
