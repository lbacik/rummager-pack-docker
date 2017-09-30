FROM resin/rpi-raspbian:jessie

RUN apt-get -y update \
	&& apt-get -y install iptables htop python3 python3-pip \
	&& rm -rf /var/lib/apt/lists/*

COPY ./conf/iptables.sav /usr/local/etc/
COPY ./conf/start.sh /usr/local/bin/

RUN pip3 install suds-jurko \
	&& pip3 install netaddr

WORKDIR /project/rummager

CMD ["/bin/bash", "-c", "/usr/local/bin/start.sh"]
