# ------------------------------SCALE-DOWN-STAGE------------------------------------
kubectl scale deployment.v1.apps/activemq --replicas=0 --namespace default
kubectl scale deployment.v1.apps/ignite-cluster --replicas=0 --namespace default
kubectl scale deployment.v1.apps/oauth2-service --replicas=0 --namespace default
kubectl scale deployment.v1.apps/order-service --replicas=0 --namespace default
kubectl scale deployment.v1.apps/reconciliation-service --replicas=0 --namespace default
kubectl scale deployment.v1.apps/dashboard-service --replicas=0 --namespace default
kubectl scale deployment.v1.apps/datadump-service --replicas=0 --namespace default
kubectl scale deployment.v1.apps/inventory-service --replicas=0 --namespace default
kubectl scale deployment.v1.apps/webapp --replicas=0 --namespace default
kubectl scale deployment.v1.apps/scheduler-service --replicas=0 --namespace default
kubectl scale deployment.v1.apps/rfm-marketing --replicas=0 --namespace default
kubectl scale deployment.v1.apps/bootadmin --replicas=0 --namespace default

# ------------------------------SCALE-UP-STAGE------------------------------------
kubectl scale deployment.v1.apps/activemq --replicas=1 --namespace default
kubectl scale deployment.v1.apps/ignite-cluster --replicas=1 --namespace default
kubectl scale deployment.v1.apps/oauth2-service --replicas=1 --namespace default
kubectl scale deployment.v1.apps/order-service --replicas=1 --namespace default
kubectl scale deployment.v1.apps/reconciliation-service --replicas=1 --namespace default
kubectl scale deployment.v1.apps/dashboard-service --replicas=1 --namespace default
kubectl scale deployment.v1.apps/datadump-service --replicas=1 --namespace default
kubectl scale deployment.v1.apps/inventory-service --replicas=1 --namespace default
kubectl scale deployment.v1.apps/webapp --replicas=1 --namespace default
kubectl scale deployment.v1.apps/scheduler-service --replicas=1 --namespace default
kubectl scale deployment.v1.apps/rfm-marketing --replicas=1 --namespace default
kubectl scale deployment.v1.apps/bootadmin --replicas=1 --namespace default
