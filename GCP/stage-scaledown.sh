echo "all pods DOWN period started"
gcloud container clusters get-credentials NAMESPACE --zone us-central1-a --project PROJECT_NAME
kubectl scale deployments --all --replicas=0
kubectl scale statefulsets --all --replicas=0
echo "all pods are DOWN now"
