echo "all node pools DOWN period started"
# gcloud container clusters resize CLUSTER_NAME --node-pool mega-services-pool --size=0 --zone=us-central1-a -q --project PROJECT_NAME
#gcloud container clusters resize CLUSTER_NAME --node-pool monolithic-2 --size=0 --zone=us-central1-a -q --project PROJECT_NAME
gcloud container clusters resize CLUSTER_NAME --node-pool monolithic --size=0 --zone=us-central1-a -q --project PROJECT_NAME
gcloud container clusters resize CLUSTER_NAME --node-pool ignite-cluster --size=0 --zone=us-central1-a -q --project PROJECT_NAME
gcloud container clusters resize CLUSTER_NAME --node-pool microservices-1 --size=0 --zone=us-central1-a -q --project PROJECT_NAME
echo "all node pools are DOWN now"
