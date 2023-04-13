#!/bin/bash

set -e

. config.sh

sudo a2dissite api doc.api www bare || echo 'Could not disbale all sites, perhaps they are already disabled'
sudo service apache2 stop
sudo -u postgres dropdb md || echo 'Could not drop the db, perhaps it does not exist'
sudo -u postgres dropuser infrastructureuser || echo 'Could not drop infrastructureuser'
sudo -u postgres dropuser infrastructureadmin || echo 'Could not drop infrastructureadmin'
sudo rm -rf /var/www/api /var/www/doc.api /var/www/www
sudo rm -f /etc/apache2/site-available/api.conf
cat /etc/hosts | grep -v "$HOSTS" | sudo tee hosts > /dev/null
sudo mv hosts /etc/hosts
sudo service apache2 start
echo "Uninstall complete."
