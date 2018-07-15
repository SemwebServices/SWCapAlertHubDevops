#!/bin/sh

# Create Default RabbitMQ setup
# Create users
# rabbitmqctl add_user <username> <password>
# rabbitmqctl add_user test_user test_user ; \
# Set user rights
# rabbitmqctl set_user_tags <username> <tag>
# rabbitmqctl set_user_tags test_user administrator ; \
# Create vhosts
# rabbitmqctl add_vhost <vhostname>
# rabbitmqctl add_vhost dummy ; \
# Set vhost permissions
# rabbitmqctl set_permissions -p <vhostname> <username> ".*" ".*" ".*"
# rabbitmqctl set_permissions -p dummy test_user ".*" ".*" ".*" ; \
( sleep 10 ; \
rabbitmqctl add_user cap cap; \
rabbitmq-plugins enable rabbitmq_web_stomp; \
rabbitmqctl set_user_tags cap administrator ; \
rabbitmqadmin --username cap --password cap declare exchange name=FeedFetcher type=topic ; \
rabbitmqadmin --username cap --password cap declare exchange name=CAPExchange type=topic ; \
rabbitmqadmin --username cap --password cap declare queue name=CAPCollatorATOMQueue durable=true ; \
rabbitmqadmin --username cap --password cap declare queue name=CAPCollatorRSSQueue durable=true ; \
rabbitmqadmin --username cap --password cap declare binding source="CAPExchange" destination_type="queue" destination="CAPCollatorATOMQueue" routing_key="ATOMEntry.#" ; \
rabbitmqadmin --username cap --password cap declare binding source="CAPExchange" destination_type="queue" destination="CAPCollatorRSSQueue" routing_key="RSSEntry.#" ; \
rabbitmqctl set_permissions cap "stomp-subscription-.*" "stomp-subscription-.*" "(FeedFetcher|CAPExchange|stomp-subscription-.*)" ; \
rabbitmqctl list_exchanges ; \
rabbitmqctl list_queues ; \
rabbitmqctl list_bindings ; \
rabbitmqctl set_permissions cap ".*" ".*" ".*" ; \
) &    
rabbitmq-server $@

