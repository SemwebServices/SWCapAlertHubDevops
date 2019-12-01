# Initialise the node
docker swarm init

# For all-in-one
docker stack deploy -c ./docker-compose.yml fah

# For separated out core and front end
docker stack deploy -c ./docker-compose-core.yml fahcore
docker stack deploy -c ./docker-compose-components.yml fahcomp

docker stack ps fah
docker stack rm fah

docker service ls

docker service inspect 6era9p6kh3kq

