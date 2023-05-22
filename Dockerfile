FROM php:8.1-fpm

RUN apt-get update \
    && apt-get -y install libzip-dev wget git unzip libpq-dev libfreetype6-dev libjpeg62-turbo-dev libpng-dev vim \

RUN docker-php-ext-install zip

RUN pecl install mongodb
RUN docker-php-ext-enable mongodb

RUN chown -R www-data:www-data /var/www

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY ./docker/php/php.ini /usr/local/etc/php/php.ini
