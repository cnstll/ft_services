FROM alpine:3.13

ENV FTP_USER=user
ENV FTP_PASS=password

RUN	apk update && apk add vsftpd openssl lftp

RUN mkdir -p /home/

COPY srcs/vsftpd.conf /etc/vsftpd
COPY srcs/entrypoint.sh /

RUN chmod +x entrypoint.sh

EXPOSE	20 21 30000

ENTRYPOINT ["/bin/sh", "entrypoint.sh"]

CMD ["usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf"]
