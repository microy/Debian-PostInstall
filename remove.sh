#! /bin/bash

#
# Remove the post-installation configuration
#

# Delete configuration files
CONFFILES=`find config -type f | sed 's:^config::'`
for FILE in $CONFFILES; do
	rm -fv $FILE
done

# Restore previous configuration files
INSTALLDIR='/usr/share/debian-postinstall'
cp -pRfv $INSTALLDIR/backup/* /

# Delete installation directory
rm -Rfv $INSTALLDIR
