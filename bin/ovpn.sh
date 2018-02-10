#!/bin/sh

 . ./.env
 
#OVPN_DATA=${COMPOSE_PROJECT_NAME}_ovpn-data

OVPN_DATA=${RUMMAGER_PACK_DIR}/etc/openvpn

docker run -v $OVPN_DATA:/etc/openvpn --rm kylemanna/openvpn ovpn_genconfig -u udp://vpn.${DOMAIN}
docker run -v $OVPN_DATA:/etc/openvpn --rm -it kylemanna/openvpn ovpn_initpki
docker run -v $OVPN_DATA:/etc/openvpn --rm -it kylemanna/openvpn easyrsa build-client-full occlient nopass
docker run -v $OVPN_DATA:/etc/openvpn --rm kylemanna/openvpn ovpn_getclient occlient > config.ovpn
