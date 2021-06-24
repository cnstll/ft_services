FROM alpine:3.13

RUN rm -rf /var/cache/apk/* \
&& rm -rf /tmp/* \
&& apk update
RUN apk add nginx \
&& apk add openssl \
&& mkdir -p /var/www/localhost \
&& mkdir -p /run/nginx \
&& mkdir -p /etc/nginx/sites-available \
&& mkdir -p /etc/nginx/sites-enabled \
&& mv /etc/nginx/nginx.conf /etc/nginx/nginx2.conf

COPY srcs/nginx.conf /etc/nginx/
COPY srcs/localhost.conf /etc/nginx/sites-available/
COPY srcs/self-signed.conf /etc/nginx/snippets/
COPY srcs/ssl-params.conf /etc/nginx/snippets/
COPY srcs/init_nginx.sh ./
COPY srcs/index.html /var/www/localhost/

RUN ln -s /etc/nginx/sites-available/localhost.conf \
/etc/nginx/sites-enabled/

RUN chown -R nginx:nginx /var/lib/nginx /var/www
EXPOSE 80
EXPOSE 443

ENTRYPOINT ["sh", "init_nginx.sh"]

CMD ["nginx", "-g", "daemon off;"]
