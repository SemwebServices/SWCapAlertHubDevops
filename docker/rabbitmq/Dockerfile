FROM rabbitmq:3.9.11-management
# FROM rabbitmq:3.7.15-management
#FROM rabbitmq:3.7.6-management

# Taken from http://mpas.github.io/post/2015/06/11/20150611_docker-rabbitmq-default-users/

# Add script to create default users / vhosts
ADD init.sh /init.sh

# Set correct executable permissions
RUN chmod +x /init.sh

# Define default command
CMD ["/init.sh"]
