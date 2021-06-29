FROM alpine:3.13

RUN apk update \
&& apk add mariadb mariadb-client \
&& mkdir -p /var/lib/mysql

COPY srcs/init_db.sh .
COPY srcs/mariadb-server.cnf /etc/my.cnf.d/

EXPOSE 3306

ENTRYPOINT ["sh", "init_db.sh"]
CMD ["/usr/bin/mysqld", "--user=root"]
