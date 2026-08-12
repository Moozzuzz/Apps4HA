#!/usr/bin/with-contenv bashio
bashio::log.info "Start to run 0.0.1j"

CONFIG_PATH=/data/options.json
SYSTEM_USER=/data/system_user.json
VERSION="$(bashio::addon.version)"

declare ingress_port
ingress_port=$(bashio::addon.ingress_port)

# echo "> setting ingress port "${ingress_port}
sed -i "s/%%port%%/${ingress_port}/g" /etc/minidlna.conf

OPTIONS="$(bashio::config 'options')"

MEDIA_DIR="$(bashio::config 'media_dir')"
dirlist=$(echo $MEDIA_DIR | tr ";" "\n")

for dir in $dirlist
do
    echo "> setting media dir: [media_dir=$dir]"
	sed -i "/XXXmedia_dirXXX/a \media_dir=$dir" /etc/minidlna.conf
done

bashio::log.info "MiniDLNA appversion $VERSION starting..."
exec /usr/sbin/minidlnad $OPTIONS
bashio::log.info "MiniDLNA launched"
