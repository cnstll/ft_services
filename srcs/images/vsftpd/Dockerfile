FROM	alpine

RUN		apk update && apk add vsftpd openssl \
&&		echo "root:password" | chpasswd  \
&&      openssl req -x509 -nodes -days 365 \
		-newkey rsa:2048 -subj "/C=FR/ST=France/L=Paris/O=42/CN=Ihateftservices" \
		-keyout /etc/ssl/private/vsftpd.key \
		-out /etc/ssl/certs/vsftpd.crt

RUN mkdir -p /home/

COPY	vsftpd.conf			/etc/vsftpd

EXPOSE	21 30021

CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf"]
