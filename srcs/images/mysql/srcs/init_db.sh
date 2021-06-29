#!/bin/sh

mkdir -p /run/mysqld

mariadb-install-db --user=root --datadir=/var/lib/mysql

mysqld --user=root --datadir=/var/lib/mysql --pid-file=/run/mysqld/mysqld.pid & sleep 3

mysql --user=root << EOF
CREATE DATABASE wordpress;
GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;
FLUSH PRIVILEGES;
GRANT ALL ON *.* TO 'admin'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;
FLUSH PRIVILEGES;

CREATE USER 'user'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'user'@'%';
FLUSH PRIVILEGES;
EOF

kill  `cat /run/mysqld/mysqld.pid`
echo "Mariadb setup"

chown -R mysql:mysql /var/lib/mysql

exec "$@"
