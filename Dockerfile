FROM php:8.5-apache

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

ENV APACHE_DOCUMENT_ROOT=/var/www/html/public

COPY . /var/www/html

RUN apt-get update \
    && apt-get install -y unzip libzip-dev \
    && docker-php-ext-install zip pdo pdo_mysql \
    && sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf \
    && sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf \
    && a2enmod rewrite \
    && rm -rf /var/lib/apt/lists/*

RUN composer install \
    --no-dev \
    --optimize-autoloader \
    --no-interaction