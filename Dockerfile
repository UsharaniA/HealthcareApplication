FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libcurl4-openssl-dev \
    mariadb-server \
    libicu-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-configure intl \
    && docker-php-ext-install -j$(nproc) gd mysqli pdo pdo_mysql curl intl

RUN apt-get update && apt-get install -y wget unzip \
    && wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.zip \
    && unzip phpMyAdmin-latest-all-languages.zip -d /var/www/ \
    && mv /var/www/phpMyAdmin-*-all-languages /var/www/phpmyadmin \
    && rm phpMyAdmin-latest-all-languages.zip \
    && chown -R www-data:www-data /var/www/phpmyadmin

RUN a2enmod rewrite


RUN mkdir -p /var/www/co-care
COPY . /var/www/co-care

COPY site.conf /etc/apache2/sites-available/000-default.conf
#disable ssl force and enable index.php to correct the page routing.
RUN sed -i 's/public bool $forceGlobalSecureRequests = true;/public bool $forceGlobalSecureRequests = false;/' /var/www/co-care/app/Config/App.php
RUN sed -i "s/public string \$indexPage = '';/public string \$indexPage = 'index.php';/" /var/www/co-care/app/Config/App.php

COPY start-script.sh /usr/local/bin/start-script.sh
COPY docker.env /var/www/co-care/.env

RUN chmod +x /usr/local/bin/start-script.sh
COPY database.sql /docker-entrypoint-initdb.d/
RUN chmod -R 777 /var/www/co-care

EXPOSE 80


ENTRYPOINT ["start-script.sh"]
