#!/usr/bin/env bash

docker-machine create rummager \
    --virtualbox-disk-size "10000" \
    --virtualbox-share-folder /Volumes/Sources/prv/rummager-pack-docker:/rummager-pack \
    --virtualbox-hostonly-cidr 192.168.210.1/24