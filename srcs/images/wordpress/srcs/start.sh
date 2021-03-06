
# Generating ssl Key
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=FR/ST=IDF/L=Paris/O=42/CN=localhost" &> /dev/null

su -s /bin/sh -c "/tmp/install_wordpress.sh" nginx
if [[ $? -ne 0 ]]
	then
		exit 1
fi

# Starting Nginx and FastCGI Server
/usr/sbin/php-fpm7
exec "$@"
