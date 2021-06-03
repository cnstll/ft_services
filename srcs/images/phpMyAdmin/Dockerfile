FROM alpine:3.13

# Downloading ssl and php necessary packages
RUN apk update \
&& apk add openssl \
&& apk add php7 php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom \
&& apk add php7-fpm

# Creating necessary directories for nginx
RUN apk add nginx \
&& mkdir -p /var/www/localhost \
&& mkdir -p /run/nginx \
&& mkdir -p /etc/nginx/sites-available \
&& mkdir -p /etc/nginx/sites-enabled

# Downloading and installing phpmyadmin
RUN apk add wget \
&& cd /var/www/localhost \
&& wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz \
&& tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz \
&& rm phpMyAdmin-5.0.2-all-languages.tar.gz \
&& mv phpMyAdmin-5.0.2-all-languages phpmyadmin \
&& rm -rf /var/www/localhost/phpmyadmin/config.sample.inc.php

# Granting Nginx access to root directory
RUN chown -R nginx:nginx /var/www/ /run/nginx \
&& chmod 755 -R /var/www/

COPY nginx.conf /etc/nginx
COPY self-signed.conf /etc/nginx/snippets/
COPY ssl-params.conf /etc/nginx/snippets/
COPY init_pma.sh .
COPY pma.conf /etc/nginx/sites-available/
COPY phpinfo.php /var/www/localhost/phpmyadmin/
#COPY index.php /var/www/localhost/phpmyadmin/

RUN ln -s /etc/nginx/sites-available/pma.conf /etc/nginx/sites-enabled

EXPOSE 5000
ENTRYPOINT ["/bin/sh", "init_pma.sh"]
#CMD ["tail", "-f", "/dev/null"]
CMD ["nginx", "-g", "daemon off;"]
