#!/bin/sh
# Stop the script as soon as an error occures
set -e

if [[ -f "/init_db.sh" ]]; then
  chmod +x /init_db.sh && ./init_db.sh
fi

exec "$@"
