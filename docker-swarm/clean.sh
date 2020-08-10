#!/bin/bash

DOCKER_CONTAINER=`docker ps | grep "postgres:11" | cut -f 1 -d ' '`

echo Vacuum and analuze on docker container $DOCKER_CONTAINER
cat ./clean.sql | docker exec -i $DOCKER_CONTAINER psql -U postgres

