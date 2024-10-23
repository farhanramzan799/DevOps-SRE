echo "Ignite pods UP period started"
gcloud container clusters get-credentials CLUSTER_NAME --zone us-central1-a --project PROJECT_NAME

# Ignite
kubectl scale deployments ignite-cluster-deployment --replicas=1 --namespace NAMESPACE
kubectl scale deployments ignite-agent --replicas=1 --namespace NAMESPACE
kubectl scale statefulsets ignite-web-console --replicas=1 --namespace NAMESPACE

echo "Ignite pods are UP now"
