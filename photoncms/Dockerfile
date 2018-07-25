FROM php:7.2.8-apache
LABEL maintainer "Francesco Zanini <francesco@zanini.me>"

ENV PHOTONCMS_VERSION 1.1.2
ENV COMPOSER_VERSION 1.6.5
ENV PHP_REDIS_VERSION 4.1.0

VOLUME /usr/src/cms/storage/app/public
WORKDIR /usr/src/

RUN apt-get update \
    && apt-get install -y unzip git libpng-dev libjpeg-dev \
    && docker-php-ext-install -j$(nproc) gd pcntl pdo_mysql \
    && pecl install redis-${PHP_REDIS_VERSION} \
    && docker-php-ext-enable redis \
    && chown -R www-data:www-data /var/www \
    && a2enmod rewrite \
    && curl -SsLo cms.tar.gz https://github.com/photoncms/cms/archive/v${PHOTONCMS_VERSION}.tar.gz \
    && tar --strip 1 -C cms -zxf cms.tar.gz \
    && chown -R www-data:www-data /usr/src/cms \
    && docker-php-source delete \
    && rm -rf /var/apt/lists/* /var/www/html /usr/src/cms.tar.gz

WORKDIR /usr/src/cms
USER www-data

RUN curl -LO https://getcomposer.org/download/${COMPOSER_VERSION}/composer.phar \
    && php composer.phar install --no-dev --no-progress \
    && php artisan storage:link \
    && ln -s .env.example .env \
    && ln -sf $(readlink -e public) /var/www/html

USER root
