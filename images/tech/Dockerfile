FROM resin/rpi-raspbian:jessie

RUN apt-get -y update
RUN apt-get -y install mysql-client php5-cli curl php5-mysql \
	wget build-essential openssl libssl-dev

COPY ./scripts/createdb.sh /usr/local/bin/

CMD /bin/bash

