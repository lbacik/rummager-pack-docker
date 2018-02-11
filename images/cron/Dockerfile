FROM docker

COPY ./conf/cacti /usr/local/bin/

RUN echo '*/5 * * * * /usr/local/bin/cacti' > /etc/crontabs/root

CMD crond -f -l 2
