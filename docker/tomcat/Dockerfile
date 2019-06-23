FROM tomcat:9.0-jre8

MAINTAINER ian.ibbotson@semweb.co

ENV JAVA_OPTS -Dfile.encoding=UTF-8
ENV JAVA_TOOL_OPTIONS -Dfile.encoding=UTF8
ENV LANG C.UTF-8

COPY CAPCollator.war /usr/local/tomcat/webapps/CAPCollator.war
COPY CAPCollator.xml /usr/local/tomcat/conf/Catalina/localhost/CAPCollator.xml
COPY feedFacade.war /usr/local/tomcat/webapps/feedFacade.war
COPY feedFacade.xml /usr/local/tomcat/conf/Catalina/localhost/feedFacade.xml

ENV JAVA_OPTS="-server -Djava.awt.headless=true -XX:+UseG1GC -Dfile.encoding=UTF-8" \
    LANG=C.UTF-8"
