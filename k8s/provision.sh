#!/bin/bash


echo Provision postgres
cd postgres
kubectl apply -f ./secret.yml
./create-configmap.sh
kubectl apply -f statefulset-master.yml
kubectl logs postgres-0
kubectl apply -f postgres-service.yml
# This command will allow us to connect on the host when using minikube
# kubectl port-forward postgres-0 5432:5432
cd ..


# RabbitMQ - See https://bitnami.com/stack/rabbitmq/helm
See also https://docs.bitnami.com/ibm/infrastructure/rabbitmq/administration/use-admin-console/

This setup will create an ingress rule for hostname rabbitmq.local - arrange for that in your hosts file or other dns setup

helm install semweb-default-rabbit \
  --set ingress.enabled=true \
  bitnami/rabbitmq -n core --create-namespace

visit http://rabbitmq.local and provision an administrative user - cap/PASSWORD

wget http://rabbitmq.local/cli/rabbitmqadmin
chmod ugo+rx ./rabbitmqadmin

./rabbitmqadmin --host rabbitmq.local --port 80 --username cap --password cap declare exchange name=FeedFetcher type=topic
./rabbitmqadmin --host rabbitmq.local --port 80 --username cap --password cap declare exchange name=CAPExchange type=topic
echo Declare queues
./rabbitmqadmin --host rabbitmq.local --port 80 --username cap --password cap declare queue name=CAPCollatorATOMQueue durable=true
./rabbitmqadmin --host rabbitmq.local --port 80 --username cap --password cap declare queue name=CAPCollatorRSSQueue durable=true
./rabbitmqadmin --host rabbitmq.local --port 80 --username cap --password cap declare queue name=FeedFeedbackQueue durable=true
echo Declare bindings
./rabbitmqadmin --host rabbitmq.local --port 80 --username cap --password cap declare binding source="CAPExchange" destination_type="queue" destination="CAPCollatorATOMQueue" routing_key="ATOMEntry.#"
./rabbitmqadmin --host rabbitmq.local --port 80 --username cap --password cap declare binding source="CAPExchange" destination_type="queue" destination="CAPCollatorRSSQueue" routing_key="RSSEntry.#"
./rabbitmqadmin --host rabbitmq.local --port 80 --username cap --password cap declare binding source="CAPExchange" destination_type="queue" destination="FeedFeedbackQueue" routing_key="FFFeedback.#"




cd ..
cd es
kubectl apply -f elasticsearch.yml
