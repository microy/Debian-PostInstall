#! /bin/sh

#
# Remove bash history files
#

rm -fv /root/.bash_history
for i in $(ls /home); do
	if [ "$i" = 'lost+found' ]; then continue; fi
	rm -fv /home/$i/.bash_history
done
