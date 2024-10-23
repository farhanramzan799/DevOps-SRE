echo "all pods UP period started"
gcloud container clusters get-credentials NAMESPACE --zone us-central1-a --project PROJECT_NAME

kubectl scale deployments activemq --replicas=1

kubectl scale deployments ignite-cluster --replicas=1
# kubectl scale deployments ignite-cluster-agent --replicas=1
# kubectl scale statefulsets ignite-web-console --replicas=1

kubectl scale deployments order-service --replicas=1

kubectl scale deployments analytics-dashboard --replicas=1
# kubectl scale deployments inventory-service --replicas=1
kubectl scale deployments oauth2-service --replicas=1
# kubectl scale deployments shopify-service --replicas=1
kubectl scale deployments webapp --replicas=1
# kubectl scale deployments bootadmin --replicas=1
# kubectl scale deployments dashboard-service --replicas=1
# kubectl scale deployments datadump-service --replicas=1
# kubectl scale deployments reconciliation-service --replicas=1
# kubectl scale deployments rfm-marketing --replicas=1
# kubectl scale deployments scheduler-service --replicas=1

echo "all pods are UP now"
