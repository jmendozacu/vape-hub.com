#!/bin/bash
# updateMagentoPermissions
# 
install_dir="/var/www/vape-hub.com/"
user="phelix"
group="www-data"

if [ "$(whoami)" != "root" ]
then
echo "Sorry, you are not root."
exit 1
fi

echo "Change Owner Recursivly."
chown -R $user:$group $install_dir
echo "Setting All File Permissions."
find $install_dir -type f -exec chmod 640 {} \;
echo "Setting All Drive Permissions."
find $install_dir -type d -exec chmod 750 {} \;
echo "Setting var File Permissions."
find $install_dir/var/ -type f -exec chmod 660 {} \;
echo "Setting media File Permissions."
find $install_dir/media/ -type f -exec chmod 660 {} \;
echo "Setting var File Permissions."
find $install_dir/var/ -type d -exec chmod 770 {} \;
echo "Setting media File Permissions."
find $install_dir/media/ -type d -exec chmod 770 {} \;
echo "Setting includes File Permissions."
chmod 770 $install_dir/includes
chmod 660 $install_dir/includes/config.php
echo "Done!"
