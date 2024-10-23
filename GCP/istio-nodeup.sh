echo "istio node pool UP period started"
gcloud container clusters resize CLUSTER_NAME --node-pool istio-system --size=1 --zone=us-central1-a -q --project PROJECT_NAME
echo "istio node pool are UP now"
