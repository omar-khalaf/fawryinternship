FROM php:8.1-fpm as php

# Install dependencies.
RUN apt-get update && apt-get install -y unzip libpq-dev libcurl4-gnutls-dev nginx libonig-dev

# Install PHP extensions.
RUN docker-php-ext-install mysqli pdo pdo_mysql bcmath curl opcache mbstring

ADD https://getcomposer.org/download/2.3.5/composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer


COPY ./php.ini /usr/local/etc/php/php.ini
COPY ./php-fpm.conf /usr/local/etc/php-fpm.d/www.conf
COPY ./nginx.conf /etc/nginx/nginx.conf


WORKDIR /var/www

# Copy files from current folder to container current folder (set in workdir).
COPY --chown=www-data:www-data . .

# Fix files ownership.
RUN chown -R www-data /var/www/storage
RUN chown -R www-data /var/www/bootstrap/cache

RUN chmod -R 755 /var/www/storage
RUN chmod -R 755 /var/www/bootstrap/cache

# Adjust user permission & group
RUN usermod --uid 1000 www-data
RUN groupmod --gid 1001 www-data

ENTRYPOINT [ "./entrypoint.sh" ]
