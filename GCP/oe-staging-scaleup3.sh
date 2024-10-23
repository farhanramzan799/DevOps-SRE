echo "Monolithic pods UP period started"
gcloud container clusters get-credentials CLUSTER_NAME --zone us-central1-a --project PROJECT_NAME

# Monolithic 1
kubectl scale deployments order-service-deployment --replicas=1 --namespace NAMESPACE
kubectl scale deployments oauth-deployment --replicas=1 --namespace NAMESPACE
kubectl scale deployments inventory-service-deployment --replicas=1 --namespace NAMESPACE
kubectl scale deployments dashboard-service-deployment --replicas=1 --namespace NAMESPACE
kubectl scale deployments bootadmin-deployment --replicas=1 --namespace NAMESPACE
# Monolithic 2
kubectl scale deployments orderdump-deployment --replicas=1 --namespace NAMESPACE
kubectl scale deployments orderdump-new-deployment --replicas=1 --namespace NAMESPACE
kubectl scale deployments scheduler-service-deployment --replicas=1 --namespace NAMESPACE
kubectl scale deployments courier-tracking-service-deployment --replicas=1 --namespace NAMESPACE
kubectl scale deployments reconciliation-service-deployment --replicas=1 --namespace NAMESPACE
# Monolithic 1 - Webapp
kubectl scale deployments webapp-deployment --replicas=1 --namespace NAMESPACE

echo "Monolithic pods are UP now"
