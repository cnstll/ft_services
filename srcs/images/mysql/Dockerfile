FROM alpine:3.13

RUN apk update \
&& apk add mariadb mariadb-client \
&& apk add openrc \
&& apk add vim --no-cache \
&& mkdir -p /var/lib/mysql

COPY init_db.sh .
COPY mariadb-server.cnf /etc/my.cnf.d/

EXPOSE 3306

ENTRYPOINT ["sh", "init_db.sh"]
CMD ["tail", "-f", "/dev/null"]
