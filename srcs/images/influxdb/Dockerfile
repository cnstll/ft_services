FROM alpine:3.13

ENV INFLUXDB_VERSION 1.8.3-r2

RUN apk update \
&& apk add wget

RUN apk add --no-cache influxdb=${INFLUXDB_VERSION} \
&& mkdir -p /var/run \
 /var/log/influxdb \
 /var/lib/influxdb/data \
 /var/lib/influxdb/wal \
&& rm -rf /etc/influxdb.conf

# COPY influxdb.conf /etc/influxdb/influxdb.conf

EXPOSE 8086

VOLUME /var/lib/influxdb

COPY entrypoint.sh /entrypoint.sh
COPY init_influxdb.sh /init_influxdb.sh

ENTRYPOINT ["sh","/entrypoint.sh"]
CMD ["influxd"]
