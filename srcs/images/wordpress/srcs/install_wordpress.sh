#wp core download --path=/var/www/localhost/wordpress
mv /tmp/wp-config.php /var/www/localhost/wordpress/
cd /var/www/localhost/wordpress/
rm -rf wp-config-sample.php

wp core is-installed
if [[ $? -eq 0 ]]
then
# Exit with last command code. $? parameter enable to fetch the exit code of the last cmd
	echo "Wordpress is already setup"
	exit 0
else
	echo "Wordpress needs to be setup"
fi

# Giving time for the DB to set up
sleep 30
wp core is-installed | grep "Error establishing"
if [[ $? -eq 0 ]]
then
	echo "DB is not up and running"
	exit 1
else
	echo "DB seems to be up, lets install wp"
fi

wp core install --url=http://$EXT_CLUSTER_IP:$WP_PORT --title="Ft Services C'est Trop Cool :)" --admin_user=admin --admin_password=password --admin_email=admin@admin.fr --skip-email
wp user create user1 user1@42.fr --role=editor --user_pass=user1
wp user create user2 user2@42.fr --role=contributor --user_pass=user2
echo "Wordpress setup complete"
