FROM php:5-cli

RUN apt-get -y update && apt-get -y install \
	unzip \
	git

COPY ./conf/setup.sh /usr/local/bin
COPY ./conf/php.ini /usr/local/etc/php/
COPY ./conf/config.local.php /tmp

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN chmod a+x /usr/local/bin/composer

VOLUME /usr/local/project
