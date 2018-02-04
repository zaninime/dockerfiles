FROM alpine:latest as builder

ENV BAIKAL_VERSION 0.4.6

WORKDIR /home
RUN apk update && \
    apk add curl sqlite
RUN curl -sSLO https://github.com/fruux/Baikal/releases/download/${BAIKAL_VERSION}/baikal-${BAIKAL_VERSION}.zip
RUN unzip -q baikal-${BAIKAL_VERSION}.zip

WORKDIR /home/baikal
RUN sqlite3 db.sqlite < Core/Resources/Db/SQLite/db.sql

FROM php:7.1-fpm-alpine
LABEL maintainer "Francesco Zanini <francesco@zanini.me>"

VOLUME /var/lib/baikal

RUN docker-php-ext-install pdo_mysql && \
    rm -rf /var/www

COPY --from=builder /home/baikal /var/www
COPY php/Specific/config*.php /var/www/Specific/
COPY php/entrypoint.sh /usr/bin/

RUN chown -R www-data:www-data /var/www && \
    touch /var/www/Specific/INSTALL_DISABLED

CMD ["/usr/bin/entrypoint.sh"]
