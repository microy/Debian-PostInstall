#! /bin/bash

#
# Remove the post-installation configuration
#

# Delete local configuration files
for FILE in `find config -type f | sed 's:^config::'`; do
	rm -fv $FILE
done

# Restore previous configuration files
cp -pRfv backup/* /
