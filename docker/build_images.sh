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
docker build -t semweb/caphub_setup:v1.0 -t semweb/caphub_setup:v1 -t semweb/caphub_setup:latest .
docker push semweb/caphub_setup:v1.0
docker push semweb/caphub_setup:v1
docker push semweb/caphub_setup:latest
cd ../nginx
echo Buildig Nginx `pwd`
docker build -t semweb/caphub_nginx:v1.0.3 -t semweb/caphub_nginx:v1.0 -t semweb/caphub_nginx:v1 -t semweb/caphub_nginx:latest .
docker push semweb/caphub_nginx:v1.0.3
docker push semweb/caphub_nginx:v1.0
docker push semweb/caphub_nginx:v1
docker push semweb/caphub_nginx:latest
