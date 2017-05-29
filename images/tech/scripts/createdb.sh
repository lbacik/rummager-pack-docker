#!/bin/bash

WORKDIR=/project/src/rummager-service/sql

cd $WORKDIR;
mysql -h rum-mysql -u root -proot < db.sql
