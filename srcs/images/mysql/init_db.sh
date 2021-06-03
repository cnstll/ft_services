#!/bin/sh
openrc &> /dev/null
touch /run/openrc/softlevel
/etc/init.d/mariadb setup &> /dev/null

service mariadb restart &> /dev/null
mysql --user=root << EOF
CREATE DATABASE wordpress;
GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;
FLUSH PRIVILEGES;

CREATE USER 'user42'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'user42'@'%';
FLUSH PRIVILEGES;
EOF

service mariadb restart

exec "$@"
