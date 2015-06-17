#! /bin/sh

#
# Install and configure CNTLM service
#

# Install CNTLM package
apt update
apt install -y cntlm

# Configure CNTLM
sed -i 's/^Username/#Username/' /etc/cntlm.conf
sed -i 's/^Domain.*/Domain		ADAUX/' /etc/cntlm.conf
sed -i 's/^Password/#Password/' /etc/cntlm.conf

# Disable CNTLM service
systemctl stop cntlm
systemctl disable cntlm

# Create a proxy launcher script
echo '#! /bin/sh

killall cntlm
echo Username: 
read USER
cntlm -I -u $USER
export http_proxy=http://127.0.0.1:3128
export https_proxy=http://127.0.0.1:3128' > /usr/local/bin/proxy-start.sh

