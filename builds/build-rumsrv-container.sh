#!/usr/bin/env bash

DEVELOPMENT=0

while getopts "h?b:H:d" opt; do 
	case "$opt" in
	h\?)
		show_help
		exit 0
		;;
	b)	BRANCH=$OPTARG
		;;
	H)	HOST="-H $OPTARG"
		;;
	d)  DEVELOPMENT=1
		;;
	esac
done

if [ -z "${BRANCH}" ]; then
	echo "You have to specify branch..."
	exit 0	
fi

SCRIPT_DIR=`dirname "$0"`

source ${SCRIPT_DIR}/../.env

PROJECT="rumsrv"
DOCKER_DIR="${SCRIPT_DIR}/.."
IMAGES="${DOCKER_DIR}/images"
TEMPLATES="/docker-images-builds/templates"
PROJECT_DIR="/usr/local/project"

SITE_NAME="${DOMAIN}"
IMAGE_NAME="${PROJECT}:${BRANCH}"

if [ $DEVELOPMENT -eq 1 ]; then

	SITE_NAME="${BRANCH}.${DOMAIN}"
	IMAGE_NAME="${PROJECT}:${BRANCH}-dev"
fi

DOCKER_BUILDER="docker-compose -f ${RUMMAGER_PACK_DIR}/docker-compose.yml run --rm  \
	docker-image-builder docker-image-builder"

${DOCKER_BUILDER} ${HOST} \
	--images-name-prefix "build-${PROJECT}-${BRANCH}-" \
	--final-image-name "${IMAGE_NAME}" \
	--remove-builds \
	"${IMAGES}/service-base" \
	"${TEMPLATES}/apache-site" \
		ARG:PROJECT_DOMAIN="${SITE_NAME}" \
		ARG:PROJECT_DIR="${PROJECT_DIR}" \
		ARG:PROJECT_PUBLIC_DIR="public"
