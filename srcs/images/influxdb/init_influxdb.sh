#!/bin/sh

# Starting influx daemon creating a pidfile. The process is run in the background with ampersand
influxd run -pidfile /var/run/influxd/influxd.pid & sleep 5

# Creating the DB "monitoring" with an admin user
influx -execute "CREATE DATABASE monitoring"
#influx -execute "CREATE RETENTION POLICY one_week ON monitoring DURATION 168h REPLICATION 1 DEFAULT"
#influx -execute "CREATE USER admin WITH PASSWORD 'admin' WITH ALL PRIVILEGES"
influx -execute "CREATE USER telegraf WITH PASSWORD 'telegraf'"
influx -execute "GRANT ALL ON monitoring TO telegraf"
influx -execute "USE monitoring"

# Kill the influx daemon process using its pid, so it can be restarted properly with CMD
kill $(cat /var/run/influxd/influxd.pid)
