FROM alpine:3.13

#ENV INFLUXDB_VERSION 1.8.3-r2
#ENV INFLUXDB_MONITORING_USER user
#ENV INFLUXDB_MONITORING_PASSWORD password
#ENV INFLUXDB_DB monitoring
#ENV INFLUXDB_RETENTION_DURATION 3d


RUN apk update \
&& apk add --no-cache influxdb
#&& apk add --no-cache influxdb=${INFLUXDB_VERSION} 
#&& mkdir -p /var/log/influxdb \
# /etc/influxdb/ \
# /var/lib/influxdb/data \
# /var/lib/influxdb/wal \
#&& rm -rf /etc/influxdb.conf

#COPY entrypoint.sh /entrypoint.sh
#COPY init_influxdb.sh /init_influxdb.sh
#COPY influxdb.conf /etc/influxdb/influxdb.conf

#VOLUME ["/var/lib/influxdb"]

EXPOSE 8086

#ENTRYPOINT ["sh","/entrypoint.sh"]
CMD ["influxd"]
#CMD ["tail", "-f", "/dev/null"]
