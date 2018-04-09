#!/usr/bin/env bash

DEVELOPMENT=0
CRON=0
SERVICE=0

while getopts "h?b:dcs" opt; do 
	case "$opt" in
	h\?)
		show_help
		exit 0
		;;
	b)	BRANCH=$OPTARG
		;;
	d)  DEVELOPMENT=1
		;;
	c)  CRON=1
		;;
	s)  SERVICE=1
		;;
	esac
done

if [ -z "${BRANCH}" ]; then
	echo "You have to specify branch..."
	exit 0	
fi

SCRIPT_DIR=`dirname "$0"`

source ${SCRIPT_DIR}/../.env

DOCKER_DIR="${SCRIPT_DIR}/.."
PROJECT="rumsrv"
TAG="${BRANCH}"
NAME="${PROJECT}"

if [ $DEVELOPMENT -eq 1 ]; then

	TAG="${BRANCH}-dev"
	NAME="${BRANCH}.${PROJECT}"
fi

if [ $SERVICE -eq 1 ]; then

	docker run --rm -d \
		--name "${NAME}" \
		-v ${PROJECT}.${BRANCH}:/usr/local/project \
		--net ${COMPOSE_PROJECT_NAME}_rum-net \
		--net-alias "${NAME}.${DOMAIN}" \
		-e VIRTUAL_HOST="${NAME}.proxy.${DOMAIN}" \
		${PROJECT}:${TAG}

	#	--dns "${NETWORK_ADDRESS}.${HOST_IP_DNS}" \
fi

if [ $CRON -eq 1 ]; then

	docker build -t "${PROJECT}-cron:${TAG}" \
		"${DOCKER_DIR}/images/service-cron" \
		--build-arg PROJECT=${PROJECT} \
		--build-arg BRANCH=${BRANCH} \
		--build-arg TAG=${TAG} \
	&&	docker run --rm -d \
		--name "${NAME}-cron" \
		-v "${PROJECT}.${BRANCH}:/usr/local/project" \
		-v "${DOCKER_SOCKET}:/var/run/docker.sock" \
		--net ${COMPOSE_PROJECT_NAME}_rum-net \
		${PROJECT}-cron:${TAG}		
fi
