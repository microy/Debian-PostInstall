#! /bin/bash

#
# Remove the post-installation configuration
#

# Delete local configuration files
for FILE in $(find config -type f | sed 's:^config::'); do
	rm -fv $FILE
done

# Restore previous configuration files
cp -pRfv backup/* /

# Archive the backup directory and remove it
tar cvfJ backup-$(date "+%Y%m%d").tar.xz backup
rm -rfv backup
