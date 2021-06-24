#!/bin/sh

mkdir -p /run/mysqld

mariadb-install-db --user=root --datadir=/var/lib/mysql

mysqld --user=root --datadir=/var/lib/mysql --pid-file=/run/mysqld/mysqld.pid & sleep 5

mysql --user=root << EOF
CREATE DATABASE wordpress;
GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;
FLUSH PRIVILEGES;

CREATE USER 'user'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'user'@'%';
FLUSH PRIVILEGES;
EOF

kill  `cat /run/mysqld/mysqld.pid`

chown -R mysql:mysql /var/lib/mysql
exec "$@"
