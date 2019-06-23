THis directory defines the caphub_tomcat image which is published on dockerhub at https://hub.docker.com/r/semweb/caphub_tomcat/


From this directory, run

    docker build .

to create the image. NOte the returned <<ImageID>>

docker login

docker tag <<ImageID>> semweb/caphub_tomcat:latest

docker push semweb/caphub_tomcat:latest

See also:
https://hackernoon.com/publish-your-docker-image-to-docker-hub-10b826793faf


THEN

on the server

log in as root and cd to /root/SWCapAlertHubDevops/vagrant, docker-compose stop, docker-compose pull, docker-compose up

docker-compose down -v -- To clear down volumes and do a full reset

