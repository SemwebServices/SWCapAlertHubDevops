docker login
# cd tomcat
# docker build -t semweb/caphub_tomcat:v1.3 -t semweb/caphub_tomcat:v1 -t semweb/caphub_tomcat:latest .
# docker push semweb/caphub_tomcat:v1.3
# docker push semweb/caphub_tomcat:v1
# docker push semweb/caphub_tomcat:latest
cd rabbitmq
echo Buildig Rabbitmq `pwd`
docker build -t semweb/caphub_rabbit:v1.0 -t semweb/caphub_rabbit:v1 -t semweb/caphub_rabbit:latest .
docker push semweb/caphub_rabbit:v1.0
docker push semweb/caphub_rabbit:v1
docker push semweb/caphub_rabbit:latest
cd ../setup
echo Buildig Setup `pwd`
docker build -t semweb/caphub_setup:v1.0.2 -t semweb/caphub_setup:v1 -t semweb/caphub_setup:latest .
docker push semweb/caphub_setup:v1.0.2
docker push semweb/caphub_setup:v1.0
docker push semweb/caphub_setup:v1
docker push semweb/caphub_setup:latest
cd ../nginx
echo Buildig Nginx `pwd`
docker build -t semweb/caphub_nginx:v1.0.15 -t semweb/caphub_nginx:v1.0 -t semweb/caphub_nginx:v1 -t semweb/caphub_nginx:latest .
docker push semweb/caphub_nginx:v1.0.15
docker push semweb/caphub_nginx:v1.0
docker push semweb/caphub_nginx:v1
docker push semweb/caphub_nginx:latest


# After building one or more images, the running component can be upgraded live with (for example)
# docker service update --image image:version label
# docker service update --image semweb/caphub_aggregator:v2.0.9 fah_capAggregator
# docker service update --image semweb/caphub_nginx:v1.0.10 fah_nginx
