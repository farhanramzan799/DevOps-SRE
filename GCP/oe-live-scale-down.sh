kubectl scale deployment.v1.apps/nginx-ingress-controller --replicas=0 --namespace ingress-nginx

kubectl scale deployment.v1.apps/webapp --replicas=0 --namespace default
kubectl scale deployment.v1.apps/scheduler-service --replicas=0 --namespace default
kubectl scale deployment.v1.apps/oauth2-service --replicas=0 --namespace default
kubectl scale deployment.v1.apps/dashboard-service --replicas=0 --namespace default
kubectl scale deployment.v1.apps/inventory-service --replicas=0 --namespace default
kubectl scale deployment.v1.apps/datadump-service --replicas=0 --namespace default
kubectl scale deployment.v1.apps/reconciliation-service --replicas=0 --namespace default
kubectl scale deployment.v1.apps/order-service --replicas=0 --namespace default
kubectl scale deployment.v1.apps/ignite-cluster --replicas=0 --namespace default
kubectl scale deployment.v1.apps/activemq --replicas=0 --namespace default
