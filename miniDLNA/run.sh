#!/usr/bin/env bash
source /usr/lib/bashio/bashio.sh

bashio::log.info "Start"

CONFIG_PATH=/data/options.json
SYSTEM_USER=/data/system_user.json
bashio::log.info "datapath loaded"

declare ingress_interface
declare ingress_port
declare ingress_entry
curl -s -H "Authorization: Bearer $SUPERVISOR_TOKEN" http://supervisor/core/info

bashio::log.info "start ingress declaraties"
ingress_port=$(bashio::addon.ingress_port)
ingress_interface=$(bashio::addon.ip_address)
ingress_entry=$(bashio::addon.ingress_entry)
bashio::log.info "ingress declaratie klaar"

MEDIA_DIR="$(bashio::config 'media_dir')"
dirlist=$(echo $MEDIA_DIR | tr ";" "\n")
friendly_name="$(bashio::config 'friendly_name')"

sed -i "s/%%port%%/${ingress_port}/g" /etc/minidlna.conf

for dir in $dirlist
do
    echo "> setting media dir: [media_dir=$dir]"
	sed -i "/#media_dir/a \media_dir=$dir" /etc/minidlna.conf
done

sed -i "s/^#\(friendly_name\).*/\1=$friendly_name/" /etc/minidlna.conf

OPTIONS="$(bashio::config 'options')"
bashio::log.info "Starting miniDLNA..."

exec /usr/sbin/minidlnad $OPTIONS
