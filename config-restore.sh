#! /bin/bash

#
# Restore configuration files
#

# Delete configuration files
for FILE in `find config -type f | sed 's:^config::'`; do
	rm -fv $FILE
done

# Restore previous configuration files
cp -pRfv `cat installdir`/backup/* /


