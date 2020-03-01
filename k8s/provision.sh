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
