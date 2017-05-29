#!/bin/bash

iptables-restore --noflush < /usr/local/etc/iptables.sav

/usr/local/sbin/runsvdir-start
