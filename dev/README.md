This directory contains files that will run the necessary componets on a developer workstation


clean up a dev setup with

docker-compose down -v --remove-orphans 



Connect to the postgres instance in the docker container with

docker exec -it cap_dev_pg psql 
