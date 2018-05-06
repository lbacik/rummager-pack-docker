FROM php:5-apache

RUN apt-get -y update && apt-get -y install \
	libxml2-dev

RUN docker-php-ext-install \
	soap \
	pdo_mysql
