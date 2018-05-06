#!/bin/sh

iptables-restore --noflush < /usr/local/etc/iptables.sav

dnsmasq -k -C /usr/local/etc/dnsmasq/dnsmasq.conf
