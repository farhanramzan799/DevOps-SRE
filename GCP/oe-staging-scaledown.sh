echo "all pods DOWN period started"
gcloud container clusters get-credentials CLUSTER_NAME --zone us-central1-a --project PROJECT_NAME
kubectl scale deployments --all --replicas=0 --namespace NAMESPACE
kubectl scale statefulsets --all --replicas=0 --namespace NAMESPACE
kubectl scale deployments authz-deployment --replicas=0 --namespace istio-system
echo "all pods are DOWN now"
