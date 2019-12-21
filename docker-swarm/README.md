# Initialise the node
docker swarm init

# We need a registry
docker service create --name registry --publish published=5000,target=5000 registry:2

# For all-in-one
docker stack deploy -c ./docker-compose.yml fah

# For separated out core and front end
docker stack deploy -c ./docker-compose-core.yml fahcore
docker stack deploy -c ./docker-compose-components.yml fahcomp

docker stack ps fah
docker stack rm fah

docker service ls

docker service inspect 6era9p6kh3kq



# To update a service
docker service update --image semweb/caphub_aggregator:v2.0.1 fah_capAggregator

To scale a component down to 0 -

docker service scale fah_capAggregator=0

To inspect the existing service

docker service inspect --pretty fah_capAggregator



docker stack services fah

