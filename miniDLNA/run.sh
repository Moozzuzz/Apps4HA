#!/usr/bin/env bashio
source /usr/lib/bashio/bashio.sh

bashio::log.warning "
START
"
bashio::log.info "Starting miniDLNA entrypoint"

bashio::log.warning "Setting variables"
CONFIG_PATH=/data/options.json
SYSTEM_USER=/data/system_user.json

MEDIA_DIR="$(bashio::config 'media_dir')"
dirlist=$(echo $MEDIA_DIR | tr ";" "\n")
for dir in $dirlist
do
    echo "> setting media dir: [media_dir=$dir]"
	sed -i "/XXXmedia_dirXXX/a \media_dir=$dir" /etc/minidlna.conf
done

# Wacht op SUPERVISOR_TOKEN veilig
TIMEOUT=30
elapsed=0
while bashio::var.is_empty "${SUPERVISOR_TOKEN:-}" && [ "$elapsed" -lt "$TIMEOUT" ]; do
  sleep 1
  elapsed=$((elapsed + 1))
  bashio::log.info "${elapsed}"
done

if bashio::var.is_empty "${SUPERVISOR_TOKEN:-}"; then
  bashio::log.warning "SUPERVISOR_TOKEN niet gevonden na ${TIMEOUT}s. Doorgaan zonder API-test."
else
  bashio::log.info "SUPERVISOR_TOKEN aanwezig, testen Supervisor API"
  # Probeer unix socket eerst
  if [ -S /var/run/supervisor.sock ]; then
    if curl --silent --fail --unix-socket /var/run/supervisor.sock \
      -H "Authorization: Bearer ${SUPERVISOR_TOKEN}" http://localhost/supervisor/info >/dev/null 2>&1; then
      bashio::log.info "Supervisor socket bereikbaar"
    else
      bashio::log.warning "Supervisor socket test mislukt"
    fi
  fi

  if curl --silent --fail -H "Authorization: Bearer ${SUPERVISOR_TOKEN}" http://supervisor/core/info >/dev/null 2>&1; then
    bashio::log.info "Supervisor HTTP endpoint bereikbaar"
  else
    bashio::log.warning "Supervisor HTTP test mislukt of token onvoldoende rechten"
  fi
fi

bashio::log.info "Starten miniDLNA daemon"
exec /usr/bin/minidlnad -f /etc/minidlna.conf -P /var/run/minidlna.pid
