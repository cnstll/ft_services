#!/bin/sh

# openrc &> /dev/null
# touch /run/openrc/softlevel
# #nginx -g 'daemon off;'
# service nginx restart &> /dev/null
# service php-fpm7 start
nginx
/usr/sbin/php-fpm7
#nginx -g 'pid /run/nginx/nginx.pid; daemon off;'
echo 'Nginx is up and running!'
exec "$@"
