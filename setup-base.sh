#! /bin/sh

#
# Base system configuration
#

# Get the date
DATE=$(date "+%Y%m%d")

# Setup apt sources in France
cp -fv /etc/apt/sources.list /etc/apt/sources.list.$DATE
cp -fv config/sources.list /etc/apt/sources.list

# Update the package database and the system
apt update
apt -y upgrade

# Cleanup the packages
apt -y autoremove
apt -y autoclean

# Configure Bash
cp -fv /etc/bash.bashrc /etc/bash.bashrc.$DATE
cp -fv config/bash.bashrc /etc/bash.bashrc

# Remove local bashrc files
mv -fv /etc/skel/.bashrc /etc/skel/.bashrc.$DATE
mv -fv /root/.bashrc /root/.bashrc.$DATE
for USER in $(ls /home); do
	if [ "$USER" = 'lost+found' ]; then continue; fi
	mv -fv /home/$USER/.bashrc /home/$USER/.bashrc.$DATE
done

# Configure sudo to keep SSH environment variables
# Used to highlight the hostname in the Bash prompt when connected via SSH
echo '# Keep SSH environment variables
Defaults	env_keep += "SSH_*"' > /etc/sudoers.d/ssh
chmod 440 /etc/sudoers.d/ssh

# Configure nano to highlight conf file syntax
cp -fv config/conf.nanorc /usr/share/nano/conf.nanorc
