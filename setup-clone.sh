#! /bin/sh

#
# Configure the system for clone machines (VM or lab)
#

# Disable history file in Bash
echo '
# Disable history file
unset HISTFILE' >> /etc/bash.bashrc
rm -fv /root/.bash_history
for i in $(ls /home); do
	if [ "$i" = 'lost+found' ]; then continue; fi
	rm -fv /home/$i/.bash_history
done

# Remove persistent network interface in udev
rm -fv /etc/udev/rules.d/70-persistent-net.rules
: > /etc/udev/rules.d/75-persistent-net-generator.rules
