#!/bin/bash


echo Provision postgres
cd postgres
kubectl apply -f ./secret.yml
./create-configmap.sh

# kubectl apply -f statefulset-master.yml
