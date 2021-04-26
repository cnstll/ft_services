FROM alpine:3.12

RUN apk update \
&& apk add nginx \
&& apk add openssl --no-cache \
&& mkdir -p /var/www/localhost \
&& mkdir -p /run/nginx \
&& mkdir -p /etc/nginx/sites-available \
&& mkdir -p /etc/nginx/sites-enabled \
&& rm -rf /etc/nginx/nginx.conf \
&& rm -rf /etc/nginx/sites-available/default

COPY nginx.conf /etc/nginx/
COPY localhost.conf /etc/nginx/sites-available/
#COPY proxy.conf /etc/nginx/conf.d/
COPY self-signed.conf /etc/nginx/snippets/
COPY ssl-params.conf /etc/nginx/snippets/
#COPY html/wordpress-wip.html /var/www/localhost
#COPY html/phpmyadmin-wip.html /var/www/localhost
COPY init_nginx.sh ./
COPY html/index.html /var/www/localhost/

RUN ln -s /etc/nginx/sites-available/localhost.conf \
/etc/nginx/sites-enabled/

RUN chown -R nginx:nginx /var/lib/nginx /var/www
EXPOSE 80
EXPOSE 443

ENTRYPOINT ["sh", "init_nginx.sh"]


#CMD ["sh", "init_nginx.sh"]
#CMD ["daemon off;"]
CMD ["nginx", "-g", "daemon off;"]
