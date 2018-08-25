FROM docker

ARG PROJECT
ARG BRANCH
ARG TAG

ENV PROJECT="${PROJECT}"
ENV BRANCH="${BRANCH}"
ENV TAG="${TAG}"

COPY ./conf/cron-20min /usr/local/bin/
COPY ./conf/cron-4h /usr/local/bin/
COPY ./conf/cron-1w /usr/local/bin/
COPY ./conf/backupdb /usr/local/bin/

RUN echo "PROJECT=${PROJECT}" > /etc/crontabs/root
RUN echo "BRANCH=${BRANCH}" >> /etc/crontabs/root
RUN echo "TAG=${TAG}" >> /etc/crontabs/root

RUN echo '0-59/20 * * * * /usr/local/bin/cron-20min' >> /etc/crontabs/root
RUN echo '7 0-23/4 * * * /usr/local/bin/cron-4h' >> /etc/crontabs/root
RUN echo '14 3 * * 1 /usr/local/bin/cron-1w' >> /etc/crontabs/root

RUN echo '30 1 * * 2 /usr/local/bin/backupdb' >> /etc/crontabs/root

CMD crond -f -l 2
