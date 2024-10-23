echo  "istio-system pods down period started"
gcloud container clusters get-credentials CLUSTER_NAME --zone us-central1-a --project PROJECT_NAME

kubectl scale deployments --all --replicas=0 --namespace istio-system
echo "istio-system pods are down now"
