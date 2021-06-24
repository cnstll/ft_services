FROM alpine:3.13
# Download Nginx and php packages

ENV EXT_CLUSTER_IP=192.168.49.2
ENV WP_PORT=5050

RUN apk update \
&& apk add --no-cache nginx \
&& apk add openssl \
&& apk add php7 php7-common php7-session php7-iconv php7-json php7-gd \
   php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi \
   php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix \
   php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php-fpm php7-phar

# Creating site root and necessary folders
RUN mkdir -p /var/www \
&& mkdir -p /var/www/localhost/ \
&& mkdir -p /run/nginx \
&& mkdir -p /etc/nginx/sites-available \
&& mkdir -p /etc/nginx/sites-enabled \
&& mkdir -p /tmp

# Downloading wordpress
RUN apk update \
&& apk add wget \
&& cd /var/www/localhost/ \
&& wget https://wordpress.org/latest.tar.gz \
&& tar -xzvf latest.tar.gz \
&& rm -rf latest.tar.gz\
&& cd /

# Download wp-cli
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&& chmod +x wp-cli.phar \
&& mv wp-cli.phar /usr/sbin/wp

COPY srcs/nginx.conf /etc/nginx/
COPY srcs/wp-site.conf /etc/nginx/sites-available/
COPY srcs/start.sh /tmp
COPY srcs/install_wordpress.sh /tmp
COPY srcs/self-signed.conf /etc/nginx/snippets/
COPY srcs/ssl-params.conf /etc/nginx/snippets/
COPY srcs/wp-config.php /tmp

# Linking directories
RUN ln -s /etc/nginx/sites-available/wp-site.conf /etc/nginx/sites-enabled/

# Granting Nginx access to root directory
RUN chown -R nginx:nginx /var/www /tmp \
&& chmod -R 755 /var/www /tmp

EXPOSE 5050

ENTRYPOINT ["/bin/sh", "/tmp/start.sh"]
CMD ["nginx", "-g", "daemon off;"]
