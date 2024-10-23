echo "istio node pool DOWN period started"
gcloud container clusters resize CLUSTER_NAME --node-pool istio-system --size=0 --zone=us-central1-a -q --project PROJECT_NAME
echo "istio node pool are DOWN now"
