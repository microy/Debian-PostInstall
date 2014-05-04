#! /bin/sh

#
# Remove the post-installation configuration
#

# If there's no backup, don't do anything
if [ ! -d backup ]; then
	exit
fi

# Delete local configuration files
for FILE in $(find config -type f | sed 's:^config::'); do
	rm -fv $FILE
done

# Restore previous configuration files
cp -pRfv backup/* /

# Remove the backup folder
rm -rfv backup
