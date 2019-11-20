docker login
cd tomcat
docker build -t semweb/caphub_tomcat:v1.3 -t semweb/caphub_tomcat:v1 -t semweb/caphub_tomcat:latest .
docker push semweb/caphub_tomcat:v1.3
docker push semweb/caphub_tomcat:v1
docker push semweb/caphub_tomcat:latest

