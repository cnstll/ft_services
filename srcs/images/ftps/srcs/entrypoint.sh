#!/bin/sh
set -e

#openssl req -x509 -nodes -days 365 \
#		-newkey rsa:2048 \
#		-keyout /etc/ssl/private/vsftpd.key.pem \
#		-out /etc/ssl/private/vsftpd.cert.pem \
#		-subj "/C=FR/ST=France/L=Paris/O=42/CN=Ihateftservices"
#
openssl req -x509 -nodes -days 365 \
		-newkey rsa:2048 \
		-keyout /etc/ssl/private/vsftpd.key \
		-out /etc/ssl/certs/vsftpd.crt \
		-subj "/C=FR/ST=France/L=Paris/O=42/CN=Ihateftservices"
# Add the FTP_USER, change his password and declare him as the owner of his home folder and all subfolders
adduser -D $FTP_USER
echo "$FTP_USER:$FTP_PASS" | /usr/sbin/chpasswd
# chroot list create a jailed env for the user declared in the list.
#Basically it isolates the user/process from the rest of the system
echo "$FTP_USER" > /etc/vsftpd/chroot.list

# Some line for testing sake
echo 'set ssl:verify-certificate no' >> /etc/lftp.conf
cd /tmp
touch file00 file01 file02
cd /

exec "$@"
