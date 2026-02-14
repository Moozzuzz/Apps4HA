ARG BUILD_FROM
FROM $BUILD_FROM

ENV VERSION 0.11.1
ENV LANG C.UTF-8
ENV TZ=Europe/Brussels

ADD https://github.com/sabre-io/Baikal/releases/download/$VERSION/baikal-$VERSION.zip .
RUN apk update
RUN apk add unzip && unzip -q baikal-$VERSION.zip

FROM nginx:alpine

RUN apk add --no-cache                \
            php85                       \
            php85-curl                 \
            php85-fpm                \
            php85-mbstring           \
            php85-mysql              \
            php85-pgsql              \
            php85-sqlite3            \
            php85-xml                \
            sqlite3                \
            msmtp                 

RUN sed -i 's/www-data/nginx/g' /etc/php8/php-fpm.d/www.conf && \
    sed -i 's/^listen = .*/listen = \/var\/run\/php-fpm.sock/' /etc/php8/php-fpm.d/www.conf

ARG BUILD_DATE
ARG VERSION
ARG BUILD_VERSION
ARG BUILD_ARCH

# Add Baikal & nginx configuration
COPY files/docker-entrypoint.d/*.sh files/docker-entrypoint.d/*.php files/docker-entrypoint.d/nginx/ /docker-entrypoint.d/
COPY --from=builder --chown=nginx:nginx baikal /var/www/baikal
COPY files/nginx.conf /etc/nginx/conf.d/default.conf
COPY --chown=nginx:nginx Plugin.php /var/www/baikal/vendor/sabre/dav/lib/CalDAV/Plugin.php

VOLUME /var/www/baikal/config
VOLUME /var/www/baikal/Specific

EXPOSE 80
