echo "all node pools UP period started"
# gcloud container clusters resize CLUSTER_NAME --node-pool mega-services-pool --size=1 --zone=us-central1-a -q --project PROJECT_NAME
gcloud container clusters resize CLUSTER_NAME --node-pool microservices-1 --size=3 --zone=us-central1-a -q --project PROJECT_NAME
gcloud container clusters resize CLUSTER_NAME --node-pool ignite-cluster --size=1 --zone=us-central1-a -q --project PROJECT_NAME
gcloud container clusters resize CLUSTER_NAME --node-pool monolithic --size=1 --zone=us-central1-a -q --project PROJECT_NAME
#gcloud container clusters resize CLUSTER_NAME --node-pool monolithic-2 --size=1 --zone=us-central1-a -q --project PROJECT_NAME
echo "all node pools are UP now"
