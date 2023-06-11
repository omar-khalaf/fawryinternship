FROM php:8.1 as php

RUN apt-get update -y
RUN apt-get install -y unzip libpq-dev libcurl4-gnutls-dev
RUN docker-php-ext-install pdo pdo_mysql bcmath

RUN pecl install -o -f redis \
    && rm -rf /tmp/pear \
    && docker-php-ext-enable redis


WORKDIR /var/www
COPY . .

ADD https://getcomposer.org/download/2.3.5/composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer


RUN composer install



# ==============================================================================

#  node
FROM node:14-alpine as node

WORKDIR /var/www
COPY . .

RUN npm install --global cross-env
RUN npm install

VOLUME /var/www/node_modules

