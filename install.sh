#!/bin/bash

set -e

. config.sh

# sudo apt update
sudo apt install -y apache2 postgresql libapache2-mod-auth-openidc libapache2-mod-auth-mellon libapache2-mod-wsgi-py3 python3-psycopg2

sudo a2enmod md auth_openidc auth_mellon wsgi rewrite ssl proxy proxy_http

sudo mkdir -p /var/www/api/html/secure /var/www/doc.api /var/www/www/html


sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt -subj '/CN=oidc.example.com/O=My Company Name LTD./C=US'
cat << EOF | sudo tee /etc/apache2/sites-available/oidc.conf > /dev/null
<VirtualHost *:443>
   ServerName oidc.example.com

   SSLEngine on
   SSLCertificateFile /etc/ssl/certs/apache-selfsigned.crt
   SSLCertificateKeyFile /etc/ssl/private/apache-selfsigned.key


   ProxyPass / http://localhost:4593/
   ProxyPassReverse / http://localhost:4593
</VirtualHost>
EOF
sudo a2ensite oidc

sudo -u postgres createdb md || echo 'Could not create DB, perhaps it already exists'
sudo -u postgres psql md -c "CREATE USER infrastructureadmin WITH PASSWORD 'md';"  || echo 'Could not create infrastrucutreadmin, perahps they already exist'
if sudo -u postgres psql md -c "CREATE USER infrastructureuser WITH PASSWORD 'md';" 
	then
		sudo -u postgres psql md -c 'GRANT CREATE ON DATABASE md TO infrastructureadmin;'
		PGPASSWORD=md psql -U infrastructureadmin -h localhost md -f "$DIR/install.sql"
	else
		echo 'Could not create user, perhaps it already exists'
fi
PGPASSWORD=md psql -U infrastructureuser -h localhost md -c "SELECT row_to_json(r.output) from greet.greet(json_populate_record(null::greet.greeting_type, '{\"greeting\":\"Hi\"}')) r;"

cp "$DIR/api.conf" /etc/apache2/sites-available/api.conf
cp "$DIR/doc.api.conf" /etc/apache2/sites-available/doc.api.conf
cp "$DIR/www.conf" /etc/apache2/sites-available/www.conf
cp "$DIR/bare.conf" /etc/apache2/sites-available/bare.conf


cat << EOF | sudo tee /var/www/api/html/secure/index.html > /dev/null
You must be logged in with OIDC to see this.
EOF

sudo cp "$DIR/pg.wsgi" /var/www/api/pg.wsgi
rsync -aHxv "$DIR/www/" /var/www/www/

if [ ! -f "$DIR/v4.18.2.tar.gz" ]
then
	echo "Fetching swagger UI ..."
        curl https://github.com/swagger-api/swagger-ui/archive/refs/tags/v4.18.2.tar.gz -L -o "$DIR/v4.18.2.tar.gz"
fi
tar zxfv "$DIR/v4.18.2.tar.gz"
sudo mv swagger-ui-4.18.2/dist /var/www/doc.api/html
rm -r swagger-ui-4.18.2

sudo a2ensite api doc.api www bare

# https://richard-purves.com/2019/05/07/apache-saml-sso-the-hard-way/
# https://stackoverflow.com/questions/11186180/editing-a-specific-virtual-host-block-using-sed

echo "Setting up $HOSTS"
if cat /etc/hosts | grep "$HOSTS"
then
	echo 'Already have hosts'
else
	echo 'Adding hosts to /etc/hosts'
	echo "$HOSTS" | sudo tee -a /etc/hosts
fi
sudo service apache2 restart
curl -X POST -d '{"greeting": "hi"}' http://api.example.com
curl http://www.example.com
curl http://example.com
curl http://doc.api.example.com
