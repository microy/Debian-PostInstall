#! /bin/bash

#
# Backup configuration files
#

# Create backup directory
INSTALLDIR=`cat installdir`
mkdir $INSTALLDIR/backup

# Backup previous configuration files
for FILE in `find config -type f | sed 's:^config::'`; do
	if [ -f $FILE ]; then
		cp -pfv --parents $FILE $INSTALLDIR/backup
	fi
done
