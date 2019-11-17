FROM tomcat:9-jdk11-adoptopenjdk-openj9

MAINTAINER ian.ibbotson@semweb.co

ENV JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF-8" \
    LANG="C.UTF-8" \
    JAVA_OPTS="-server -Djava.awt.headless=true -XX:+UseG1GC -Dfile.encoding=UTF-8"

COPY CAPAggregator.war /usr/local/tomcat/webapps/CAPAggregator.war
COPY CAPAggregator.xml /usr/local/tomcat/conf/Catalina/localhost/CAPAggregator.xml
COPY feedFacade.war /usr/local/tomcat/webapps/feedFacade.war
COPY feedFacade.xml /usr/local/tomcat/conf/Catalina/localhost/feedFacade.xml

    
