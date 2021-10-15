kumactl install control-plane --license-path=~/.kong-mesh-license.json | kubectl apply -f -

kubectl port-forward svc/kong-mesh-control-plane -n kong-mesh-system 5681:5681 > /dev/null 2>&1 &

kubectl port-forward svc/frontend 8080 > /dev/null 2>&1 &

kubectl port-forward svc/jaeger-query -n kong-mesh-tracing 8090:80 > /dev/null 2>&1 &