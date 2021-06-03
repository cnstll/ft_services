#!/bin/sh
set -e

# Add the FTP_USER, change his password and declare him as the owner of his home folder and all subfolders
adduser --disabled-password $FTP_USER
echo "$FTP_USER:$FTP_PASS" | /usr/sbin/chpasswd
chown -R $FTP_USER:$FTP_USER /home/$FTP_USER

exec "$@"
