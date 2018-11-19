FROM debian:stretch

RUN apt-get -y update && apt-get -y install \
	curl \
	wget \
	build-essential \
	openssl \
	libssl-dev \
	git \
	mariadb-client

#	php5-cli 
#	php5-mysql

COPY ./scripts/createdb.sh /usr/local/bin/
COPY ./scripts/backupdb.sh /usr/local/bin/
COPY ./scripts/backup-x.sh /usr/local/bin/

# CMD /bin/bash
