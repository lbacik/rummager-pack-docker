FROM python:3

RUN apt-get -y update
RUN apt-get -y install htop

COPY ./conf/iptables.sav /usr/local/etc/
COPY ./conf/start.sh /usr/local/bin/

RUN apt-get -y install iptables

WORKDIR /project/rummager

# unfortunately we cannot use here command like:
#RUN pip install -r ../src/rummager/requirements.txt

RUN pip install suds-jurko
RUN pip install netaddr

CMD ["/bin/bash", "-c", "/usr/local/bin/start.sh"]
