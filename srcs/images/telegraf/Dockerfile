FROM alpine:3.13

ENV TELEGRAF_VERSION 1.17.3

RUN apk update \
&& apk add wget

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}_static_linux_amd64.tar.gz \
&& mkdir -p /usr/src /etc/telegraf \
&& tar -C /usr/src -xzf telegraf-${TELEGRAF_VERSION}_static_linux_amd64.tar.gz \
&& mv /usr/src/telegraf*/etc/telegraf/telegraf.conf /etc/telegraf/ \
&& mkdir /etc/telegraf/telegraf.d \
&& cp -a /usr/src/telegraf*/usr/bin/telegraf /usr/bin/ \
&& rm -rf *.tar.gz* /usr/src \
&& mkdir -p /var/run

VOLUME /var/lib/

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh","/entrypoint.sh"]
CMD ["telegraf"]

