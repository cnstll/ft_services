#!/bin/sh

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=FR/ST=IDF/L=Paris/O=42/CN=localhost" &> /dev/null

#openrc &> /dev/null
#touch /run/openrc/softlevel
#nginx -g 'daemon off;'
#service nginx restart &> /dev/null
exec "$@"
