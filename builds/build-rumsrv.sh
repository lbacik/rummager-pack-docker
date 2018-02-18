#!/usr/bin/env bash

while getopts "h?b:" opt; do 
	case "$opt" in
	h\?)
		show_help
		exit 0
		;;
	b)	BRANCH=$OPTARG
		;;
	esac
done

if [ -z "${BRANCH}" ]; then
	echo "You have to specify branch..."
	exit 0	
fi

SCRIPT_DIR=`dirname "$0"`

source ${SCRIPT_DIR}/../.env

GIT_URL="https://github.com/lbacik/rummager-service.git"

docker build -t rum-build-service \
	${RUMMAGER_PACK_DIR}/images/build-service \
&& docker run --rm -ti \
	-v rumsrv.${BRANCH}:/usr/local/project \
	rum-build-service \
		/usr/local/bin/setup.sh \
			-g $GIT_URL \
			-b $BRANCH
