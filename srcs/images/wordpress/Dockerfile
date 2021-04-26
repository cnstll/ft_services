FROM alpine:3.12

# Download Nginx and creating necessary directories
RUN apk add nginx \
&& apk add php7-common php7-session php7-iconv php7-json php7-gd \
   php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi \
   php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix \
   php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php-fpm \
&& mkdir -p /run/nginx \
&& mkdir -p /etc/nginx/sites-available \
&& mkdir -p /etc/nginx/sites-enabled

# Creating site root
RUN mkdir -p /var/www \
&& mkdir -p /var/www/localhost/

# Downloading wordpress
RUN apk update \
&& apk add wget \
&& cd /var/www/localhost/ \
&& wget https://wordpress.org/latest.tar.gz \
&& tar -xzvf latest.tar.gz \
&& rm -rf latest.tar.gz

# Granting Nginx access to root directory
RUN chown -R nginx:nginx /var/www/localhost \
&& chmod -R 755 /var/www/

COPY srcs/nginx.conf /etc/nginx/
COPY srcs/wp-site /etc/nginx/sites-available/
COPY srcs/start.sh /

RUN ln -s /etc/nginx/sites-available/wp-site /etc/nginx/sites-enabled/

EXPOSE 5050

ENTRYPOINT ["/bin/sh", "start.sh"]
CMD ["tail", "-f", "/dev/null"]
#CMD ["nginx", "-g", "daemon off;"]
