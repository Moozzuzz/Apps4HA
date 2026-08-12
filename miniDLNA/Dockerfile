FROM ghcr.io/home-assistant/base:latest

# set version label
ARG BUILD_DATE
ARG VERSION
ARG BUILD_VERSION
ARG BUILD_ARCH

# Add env
ENV LANG=C.UTF-8
ENV TZ=Europe/Brussels

# Setup base
# install minidlna
RUN apk add --no-cache minidlna

# Copy data
COPY run.sh /
RUN chmod a+x /run.sh

COPY minidlna.conf /etc/minidlna.conf

CMD [ "/run.sh" ]

LABEL \
    org.opencontainers.image.title="Apps4HA: miniDLNA app" \
    org.opencontainers.image.description="This app (~addon) provides you with the latest miniDLNA on Alpine." \
    org.opencontainers.image.source="https://github.com/Moozzuzz/Apps4HA/tree/main/miniDLNA" \
