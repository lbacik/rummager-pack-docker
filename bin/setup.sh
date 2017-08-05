#!/usr/bin/env bash

DOCKER="docker-compose"

$DOCKER up -d rum-mysql

$DOCKER build --no-cache rum-rumsrv
$DOCKER build --no-cache rum-tech
$DOCKER build --no-cache rum-smtp
$DOCKER build --no-cache rum-worker

bin/createdb.sh

$DOCKER up -d rum-worker
