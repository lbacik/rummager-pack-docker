#!/usr/bin/env bash

while getopts "h?t:" opt; do 
	case "$opt" in
	h\?)
		show_help
		exit 0
		;;
	b)	BRANCH=$OPTARG
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
TAG="${BRANCH}"

if [ $DEVELOPMENT -eq 1 ]; then

	TAG="${BRANCH}-dev"
fi

docker run --rm \
	-v ${PROJECT}.${BRANCH}:/usr/local/project \
	${PROJECT}:${TAG}
