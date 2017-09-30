#!/bin/sh

PROJDIR=/project/rummager

iptables-restore --noflush < /usr/local/etc/iptables.sav

python3 ${PROJDIR}/rummager.py
