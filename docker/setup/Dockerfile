FROM alpine:latest


# Add script to create default users / vhosts
ADD setup.sh /setup.sh
ADD config_es7.sh /config_es7.sh

# Set correct executable permissions
RUN chmod +x /setup.sh \
    && chmod +x /config_es7.sh \
    && apk add --no-cache curl \
    && apk add bash

# Define default command
CMD ["/setup.sh"]
