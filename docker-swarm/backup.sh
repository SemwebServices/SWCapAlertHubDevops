#!/bin/bash

DOCKER_CONTAINER=`docker ps | grep "postgres:11" | cut -f 1 -d ' '`

echo Backing up docker container $DOCKER_CONTAINER
docker exec $DOCKER_CONTAINER /usr/bin/pg_dumpall -U postgres | gzip -9 > /home/ubuntu/backups/pg_full_`date -Iseconds`

echo Only keep the last 6 backup files
ls -1 /home/ubuntu/backups/pg_full_* | sort -r | tail -n +6 | xargs rm > /dev/null 2>&1
