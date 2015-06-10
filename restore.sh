#! /bin/sh

#
# Remove the post-installation configuration
#

# If there's no backup, don't do anything
if [ ! -d backup ]; then
	echo 'No backup directory present...'
	exit
fi

# Delete local configuration files
for FILE in $(find setup -type f | sed 's:^setup::'); do
	rm -fv $FILE
done

# Restore previous configuration files
cp -pRfv backup/* /
