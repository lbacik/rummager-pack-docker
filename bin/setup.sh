#!/usr/bin/env bash

DOCKER="docker-compose"

$DOCKER build --no-cache rum-rumsrv
$DOCKER build --no-cache rum-tech
$DOCKER build --no-cache rum-smtp
$DOCKER build --no-cache rum-worker

$DOCKER up -d rum-rumsrv

bin/createdb.sh

$DOCKER up -d rum-worker
