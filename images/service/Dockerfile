
FROM php:5-apache

RUN apt-get -y update
RUN apt-get -y install libxml2-dev

RUN docker-php-ext-install soap pdo_mysql

RUN pecl install xdebug
RUN docker-php-ext-enable --ini-name xdebug.ini xdebug

COPY ./conf/xdebug.ini /tmp/
RUN cat /tmp/xdebug.ini >> /usr/local/etc/php/conf.d/xdebug.ini && rm -f /tmp/xdebug.ini

COPY ./conf/apache.conf /etc/apache2/sites-available/rumsrv.conf
RUN a2ensite rumsrv
