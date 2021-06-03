# Some Useful Mysqli/mariadb CMD
### Showing db
`SHOW DATABASES;`
### Showing hosts and users
`SELECT Host, User FROM mysql.user;`
### Showing all fields associated with mysql.user table
`DESC mysql.user;`
###  Finding user rights by Db qnd host
`SELECT User, Db, Host from mysql.db;`
###  Finding user privileges on all host
`SHOW GRANTS FOR 'username'@'hostname'`
