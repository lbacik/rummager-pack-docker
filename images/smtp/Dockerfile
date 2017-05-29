
FROM tozd/postfix

RUN apt-get -y update
RUN apt-get -y install iptables

COPY ./conf/iptables.sav /usr/local/etc/
COPY ./conf/start.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/start.sh"]
