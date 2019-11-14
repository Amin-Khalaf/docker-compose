FROM php:7.3-apache

MAINTAINER Amin KHALAF "amin.khalaf@example.com"

RUN apt-get update -q \
    && apt-get install -y --no-install-recommends wget git \
    && rm -rf /var/lib/apt/list/* \
    && rm -fr /var/cache/apt/archives/*


WORKDIR /var/www

RUN rm -fr /var/www/html \
    && git clone --depth 1 https://github.com/Dolibarr/dolibarr.git -b 10.0.3 /var/www/html/dolibarr

RUN chown -R www-data.www-data /var/www/html/dolibarr \
    && chmod -R 755 /var/www/html/dolibarr
WORKDIR /var/www/html/dolibarr 
RUN touch htdocs/conf/conf.php && chown www-data htdocs/conf/conf.php

