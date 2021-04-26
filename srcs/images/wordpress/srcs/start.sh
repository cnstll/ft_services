# Granting Nginx access to root files
#chown -R nginx:nginx /var/www/localhost
#chmod -R 754 /var/www/localhost

# Starting Nginx and FastCGI Server
nginx
/usr/sbin/php-fpm7
exec "$@"
