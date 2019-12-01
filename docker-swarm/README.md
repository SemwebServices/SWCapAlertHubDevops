# Initialise the node
docker swarm init

docker stack deploy -c ./docker-compose.yml fah
docker stack ps fah
docker stack rm fah

docker service ls

docker service inspect 6era9p6kh3kq

