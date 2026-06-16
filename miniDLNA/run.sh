#!/usr/bin/env bash
source /usr/lib/bashio/bashio.sh

bashio::log.warning "
START
"
bashio::log.info "Starting miniDLNA entrypoint"

bashio::log.warning "Setting variables"
CONFIG_PATH=/data/options.json
SYSTEM_USER=/data/system_user.json

find / -type f -name "*minidlnad*"

bashio::log.warning "Starten miniDLNA daemon"
exec /usr/sbin/minidlnad -f /etc/minidlna.conf -P /var/run/minidlna.pid
