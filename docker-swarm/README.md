# Initialise the node
docker swarm init

# We need a registry

    docker service create --name registry --publish published=5000,target=5000 registry:2

# For all-in-one

    docker stack deploy -c ./docker-compose.yml fah

# Inspect

    docker stack ps fah
    docker service inspect 6era9p6kh3kq

# Deastroy

    docker stack rm fah

# List all services

    docker service ls


# To update a service to a specific version

    docker service update --image semweb/caphub_aggregator:v2.0.1 fah_capAggregator

To scale a component down to 0 -

    docker service scale fah_capAggregator=0

To inspect the existing service

    docker service inspect --pretty fah_capAggregator


# other handy commands

    docker stack services fah

Access the postgres shell through docker - for example

    docker exec -it e9563cf988cc psql -U postgres capcollatorprod


