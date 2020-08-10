

Initially inspired by https://github.com/foxylion/docker-rabbitmq/blob/master/examples/kubernetes.yml -- this is out of date tho

https://zupzup.org/k8s-rabbitmq-cluster/ looks helpful
https://hub.docker.com/r/kuberstack/kubernetes-rabbitmq-autocluster/ also
https://github.com/rabbitmq/rabbitmq-peer-discovery-k8s/tree/master/examples/minikube -- official



# BETTER:

See https://bitnami.com/stack/rabbitmq/helm
helm repo add bitnami https://charts.bitnami.com/bitnami

helm install rabbitqm bitnami/rabbitmq -n core --create-namespace 


ianibbo@phoenix:~$ helm install rabbitqm bitnami/rabbitmq -n core --create-namespace 
NAME: rabbitqm
LAST DEPLOYED: Sat Aug  8 13:36:06 2020
NAMESPACE: core
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
** Please be patient while the chart is being deployed **

Credentials:

    echo "Username      : user"
    echo "Password      : $(kubectl get secret --namespace core rabbitqm-rabbitmq -o jsonpath="{.data.rabbitmq-password}" | base64 --decode)"
    echo "ErLang Cookie : $(kubectl get secret --namespace core rabbitqm-rabbitmq -o jsonpath="{.data.rabbitmq-erlang-cookie}" | base64 --decode)"

RabbitMQ can be accessed within the cluster on port  at rabbitqm-rabbitmq.core.svc.

To access for outside the cluster, perform the following steps:

To Access the RabbitMQ AMQP port:

    echo "URL : amqp://127.0.0.1:5672/"
    kubectl port-forward --namespace core svc/rabbitqm-rabbitmq 5672:5672

To Access the RabbitMQ Management interface:

    echo "URL : http://127.0.0.1:15672/"
    kubectl port-forward --namespace core svc/rabbitqm-rabbitmq 15672:15672
ianibbo@phoenix:~$ 


This will give us a service as follows

ianibbo@phoenix:~$ kubectl describe pod/rabbitqm-rabbitmq-0 -n core | mor^C
130 ianibbo@phoenix:~$ kubectl get services -n core
NAME                         TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)                                 AGE
rabbitqm-rabbitmq            ClusterIP   10.152.183.203   <none>        5672/TCP,4369/TCP,25672/TCP,15672/TCP   4m20s
rabbitqm-rabbitmq-headless   ClusterIP   None             <none>        4369/TCP,5672/TCP,25672/TCP,15672/TCP   4m20s
ianibbo@phoenix:~$ ls

