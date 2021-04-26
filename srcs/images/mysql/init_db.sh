#!/bin/sh
openrc &> /dev/null
touch /run/openrc/softlevel
/etc/init.d/mariadb setup &> /dev/null
service mariadb restart &> /dev/null
mysql --user=root << EOF
CREATE DATABASE wordpress;
GRANT ALL ON wordpress.* TO 'wordpress'@'localhost' IDENTIFIED BY 'wordpress' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF
#tail -f /dev/null

exec "$@"
