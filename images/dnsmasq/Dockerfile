FROM andyshinn/dnsmasq

RUN apk update \
	&& apk add iptables

COPY ./conf/iptables.sav /usr/local/etc/
COPY ./conf/start.sh /usr/local/bin/

ENTRYPOINT start.sh
