FROM debian

RUN apt-get -y update
RUN apt-get -y install mysql-client php5-cli curl php5-mysql

COPY ./scripts/createdb.sh /usr/local/bin/

CMD /bin/bash

