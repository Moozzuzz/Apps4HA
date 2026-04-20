ARG BUILD_FROM=ghcr.io/home-assistant/base:latest
FROM $BUILD_FROM

# set version label
ARG VERSION
ARG BUILD_VERSION

LABEL \
  io.hass.version="VERSION" \
  io.hass.type="app" \
  io.hass.arch="aarch64|amd64"

# Add env
ENV LANG C.UTF-8
ENV TZ=Europe/Brussels

# Setup base
# install minidlna
RUN apk add --no-cache minidlna

# Copy data
COPY run.sh /
RUN chmod a+x /run.sh
COPY minidlna.conf /etc/minidlna.conf

CMD [ "/run.sh" ]
