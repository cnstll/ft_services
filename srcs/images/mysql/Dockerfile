FROM alpine

RUN apk update \
&& apk add mariadb mariadb-client \
&& apk add openrc \
&& apk add vim --no-cache

COPY init_db.sh .

EXPOSE 3306

ENTRYPOINT ["sh", "init_db.sh"]
CMD ["tail", "-f", "/dev/null"]
