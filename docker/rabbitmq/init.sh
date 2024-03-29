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
#
# rabbitmq-plugins enable rabbitmq_web_mqtt; \
#
# echo Dont forget that docker-compose might not rebuild this container - use docker-compose build if you edit this file
#
( sleep 30 ; \
echo Commence Rabbit setup; \
echo ---------------------; \
rabbitmqctl add_user cap cap; \
rabbitmq-plugins enable rabbitmq_stomp; \
rabbitmq-plugins enable rabbitmq_mqtt; \
rabbitmq-plugins enable rabbitmq_web_stomp; \
rabbitmq-plugins enable rabbitmq_management; \
rabbitmqctl set_user_tags cap administrator ; \
sleep 2; \
echo Perform setup; \
rabbitmqctl set_permissions cap "stomp-subscription-.*" "stomp-subscription-.*" "(FeedFetcher|CAPExchange|stomp-subscription-.*)" ; \
rabbitmqctl set_permissions cap ".*" ".*" ".*" ; \
rabbitmqctl add_user mqtt-test mqtt-test; \
rabbitmqctl set_permissions -p / mqtt-test ".*" ".*" ".*"; \
rabbitmqctl set_user_tags mqtt-test management; \
echo Declare exchanges; \
rabbitmqadmin --username cap --password cap declare exchange name=FeedFetcher type=topic ; \
rabbitmqadmin --username cap --password cap declare exchange name=CAPExchange type=topic ; \
echo Declare queues; \
rabbitmqadmin --username cap --password cap declare queue name=CAPCollatorATOMQueue durable=true ; \
rabbitmqadmin --username cap --password cap declare queue name=CAPCollatorRSSQueue durable=true ; \
rabbitmqadmin --username cap --password cap declare queue name=FeedFeedbackQueue durable=true ; \
echo Declare bindings; \
rabbitmqadmin --username cap --password cap declare binding source="CAPExchange" destination_type="queue" destination="CAPCollatorATOMQueue" routing_key="ATOMEntry.#" ; \
rabbitmqadmin --username cap --password cap declare binding source="CAPExchange" destination_type="queue" destination="CAPCollatorRSSQueue" routing_key="RSSEntry.#" ; \
rabbitmqadmin --username cap --password cap declare binding source="CAPExchange" destination_type="queue" destination="FeedFeedbackQueue" routing_key="FFFeedback.#" ; \
echo Report exchanges, queues, bindings; \
rabbitmqctl list_exchanges ; \
rabbitmqctl list_queues ; \
rabbitmqctl list_bindings ; \
echo Rabbit setup complete; \
) &    
rabbitmq-server $@

