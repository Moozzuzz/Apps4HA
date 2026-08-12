#!/usr/bin/with-contenv bashio
bashio::log.info "Start to run"

CONFIG_PATH=/data/options.json
SYSTEM_USER=/data/system_user.json

# declare ingress_port
# declare ingress_interface
# declare ingress_entry

# ingress_port=$(bashio::addon.ingress_port)
# ingress_interface=$(bashio::addon.ip_address)
# ingress_entry=$(bashio::addon.ingress_entry)

# echo "> setting ingress port "${ingress_port}
# sed -i "s/%%port%%/${ingress_port}/g" /etc/minidlna.conf

MEDIA_DIR="$(bashio::config 'media_dir')"
dirlist=$(echo $MEDIA_DIR | tr ";" "\n")

for dir in $dirlist
do
    echo "> setting media dir: [media_dir=$dir]"
	sed -i "/XXXmedia_dirXXX/a \media_dir=$dir" /etc/minidlna.conf
done

OPTIONS="$(bashio::config 'options')"
bashio::log.info "MiniDLNA starting..."
usr/sbin/minidlnad $OPTIONS
bashio::log.info "MiniDLNA launched"

