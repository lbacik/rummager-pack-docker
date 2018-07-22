#!/bin/bash

BACKUPDIR=/backups
DATABASE=sn

DATE=`date +%Y%m%d`

BACKUP_NAME=${BACKUPDIR}/${DATABASE}-${DATE}
BACKUP_FILE=${BACKUP_NAME}.sql
BACKUP_FILE_NODATA=${BACKUP_NAME}-nodata.sql

mysqldump -h rum-mysql -u root -proot --no-data $DATABASE > ${BACKUP_FILE_NODATA}
gzip ${BACKUP_FILE_NODATA}

mysqldump -h rum-mysql -u root -proot $DATABASE > ${BACKUP_FILE}
gzip ${BACKUP_FILE}
