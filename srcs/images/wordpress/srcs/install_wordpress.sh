#wp core download --path=/var/www/localhost/wordpress
mv /tmp/wp-config.php /var/www/localhost/wordpress/
cd /var/www/localhost/wordpress/
rm -rf wp-config-sample.php

wp core is-installed
if [[ $? -eq 0 ]]
then
# Exit with last command code. $? parameter enable to fetch the exit code of the last cmd
	exit 0
fi

# Giving time for the DB to set up
sleep 10

wp core install --url=http://$EXT_CLUSTER_IP:$WP_PORT --title="Ft Services C'est Trop Cool :)" --admin_user=admin --admin_password=password --admin_email=admin@admin.fr --skip-email
wp user create user1 user1@42.fr --role=editor --user_pass=user1
wp user create user2 user2@42.fr --role=contributor --user_pass=user2
