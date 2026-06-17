FROM ghcr.io/home-assistant/base:latest

# Install minidlna
RUN apk add --no-cache minidlna


# Copy data for app
COPY run.sh /
RUN chmod a+x /run.sh
COPY minidlna.conf /etc/minidlna.conf

CMD [ "/run.sh" ]