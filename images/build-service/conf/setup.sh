#!/usr/bin/env bash

while getopts "h?b:g:" opt; do 
	case "$opt" in
	h\?)
		show_help
		exit 0
		;;
	b)	BRANCH=$OPTARG
		;;
	g)  GIT_URL=$OPTARG
		;;
	esac
done

if [ -z "${BRANCH}" ]; then
	echo "You have to specify branch..."
	exit 0	
fi

if [ -z "${GIT_URL}" ]; then
	echo "You have to specify git url..."
	exit 0	
fi

PROJECT_DIR="/usr/local/project"

cd ${PROJECT_DIR}

git clone -b ${BRANCH} ${GIT_URL} .

composer install --no-dev

cp /tmp/config.local.php .
