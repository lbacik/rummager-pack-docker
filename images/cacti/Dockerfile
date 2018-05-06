FROM debian:stretch

ADD \
	https://raw.githubusercontent.com/docker-library/php/master/7.0/jessie/apache/apache2-foreground \
	/usr/local/bin

RUN chmod a+x /usr/local/bin/apache2-foreground

RUN export DEBIAN_FRONTEND=noninteractive; \
	apt-get -y update && apt-get -y install \
		sudo \
		cacti

RUN sed -i 's/$database_hostname = "localhost"/$database_hostname = "mysql"/' \
		/usr/share/cacti/site/include/config.php \
	&& sed -i 's/$database_password = .*$/$database_password = "cacti";/' \
		/usr/share/cacti/site/include/config.php

VOLUME /var/lib/cacti/rra

EXPOSE 80

CMD apache2-foreground
