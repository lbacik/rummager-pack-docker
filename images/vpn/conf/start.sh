#!/bin/bash

iptables-restore --noflush < /usr/local/etc/iptables.sav

ovpn_run
