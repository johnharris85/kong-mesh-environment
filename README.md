kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" 

kubectl apply -f metallb-full.yaml

// docker network inspect -f '{{.IPAM.Config}}' kind if required, mine's hardcoded, depends on kind network name

kubectl apply -f metallb-configmap.yaml

// Install Kong / KIC steps

LB_IP=$(kubectl get svc/foo-service -o=jsonpath='{.status.loadBalancer.ingress[0].ip}')

kumactl install control-plane --license-path=~/.kong-mesh-license.json | kubectl apply -f -

kubectl port-forward svc/kong-mesh-control-plane -n kong-mesh-system 5681:5681 > /dev/null 2>&1 &

kubectl port-forward svc/frontend 8080 > /dev/null 2>&1 &

kubectl port-forward svc/jaeger-query -n kong-mesh-tracing 8090:80 > /dev/null 2>&1 &