FROM nginx:1.9

ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.6.0/wait /wait
RUN chmod +x /wait

# CMD /wait && java -Djava.security.egd=file:/dev/./urandom -Xshareclasses -Xscmx50M -Xtune:virtualized -jar /CAPAggregator.war

#  default conf for proxy service
COPY html/ /var/www/html/
COPY ./nginx_default.conf /etc/nginx/conf.d/default.conf

CMD /wait && nginx -g "daemon off";
