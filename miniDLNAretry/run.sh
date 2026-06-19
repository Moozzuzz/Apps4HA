#!/usr/bin/with-contenv bashio
HTTP_PORT=$(bashio::config 'http_port')

echo "Hello supervisor on port {$HTTP_PORT}!. API-token is:"
echo $SUPERVISOR_TOKEN
echo "Above is a token."

exec /usr/bin/minidlna -f /etc/minidlna -P /run/minidlna.pid -d
