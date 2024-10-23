kubectl scale deployment.v1.apps/activemq --replicas=1 --namespace default
kubectl scale deployment.v1.apps/ignite-cluster --replicas=1 --namespace default

kubectl scale deployment.v1.apps/order-service --replicas=1 --namespace default
kubectl scale deployment.v1.apps/reconciliation-service --replicas=1 --namespace default
kubectl scale deployment.v1.apps/datadump-service --replicas=1 --namespace default
kubectl scale deployment.v1.apps/inventory-service --replicas=1 --namespace default
kubectl scale deployment.v1.apps/dashboard-service --replicas=1 --namespace default
kubectl scale deployment.v1.apps/oauth2-service --replicas=1 --namespace default
kubectl scale deployment.v1.apps/scheduler-service --replicas=1 --namespace default
kubectl scale deployment.v1.apps/webapp --replicas=1 --namespace default

# activemq gives error until nginx is up
kubectl scale deployment.v1.apps/nginx-ingress-controller --replicas=1 --namespace ingress-nginx
