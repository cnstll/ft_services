#!/bin/sh
# Stop the script as soon as an error occures
set -e

# Put influxdb in first position of positionnal parameters
#if [ "${1:0:1}" = '-' ]; then
#    set -- influxd "$@"
#fi

# Run influxdb init script
#if [ "$1" = 'influxd' ]; then
#	 chmod 755 init_influxdb.sh && ./init_influxdb.sh "${@:2}"
#fi
if [[ -f "/init_db.sh" ]]; then
  chmod +x /init_db.sh && ./init_db.sh
fi

exec "$@"
