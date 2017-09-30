#!/usr/bin/env bash

while getopts "h?H:" opt; do 
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
		--images-name-prefix "build-php-" \
		--final-image-name "php:build" \
		--remove-builds \
		first \
		php/5.6/apache
	