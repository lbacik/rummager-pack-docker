#!/usr/bin/env bash

while getopts "h?p:b:H:" opt; do 
	case "$opt" in
	h\?)
			show_help
			exit 0
			;;
	H)	HOST="-H $OPTARG"
			;;				
	esac
done

DOCKER_BUILDER=docker-image-builder

${DOCKER_BUILDER} ${HOST} \
		--images-name-prefix "build-postfix-" \
		--final-image-name "postfix:build" \
		--remove-builds \
		first \
		docker-base \
		docker-runit \
		docker-postfix
	