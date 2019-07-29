#!/bin/bash

BACKUPDIR=/backups
DATABASE=$1

DATE=`date +%Y%m%d`

BACKUP_NAME=${BACKUPDIR}/${DATABASE}-${DATE}
BACKUP_FILE=${BACKUP_NAME}.sql

mysqldump -h rum-mysql -u root -proot --routines $DATABASE > ${BACKUP_FILE}
gzip ${BACKUP_FILE}
