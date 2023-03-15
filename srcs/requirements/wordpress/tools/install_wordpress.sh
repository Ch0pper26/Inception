#!/bin/bash

if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else

	#Installer l'archive wordpress
	wget http://wordpress.org/latest.tar.gz
	#Decompresser l'archive wordpress
	tar xfz latest.tar.gz
	#Changer de dir les fichier wordpress
	mv wordpress/* .
	#surprimer l'archive et le dossier wordpress
	rm -rf latest.tar.gz
	rm -rf wordpress

	#Importe les variable d'environement dans le fichier de config
	sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php
	wp user create master eliotblnd.travail@gmail.com --role=administrator --user_pass=inception --allow-root
	wp user update eblondee --allow-root --role=none
fi

exec "$@"
