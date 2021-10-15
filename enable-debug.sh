#!/bin/sh

PODS=$(kubectl get po -n kuma-demo -ojsonpath='{.items[*].metadata.name}')
for pod in $PODS ; do 
    kubectl exec -it -n kuma-demo $pod -c netshoot -- curl -X POST localhost:9901/logging?level=debug > /dev/null
done