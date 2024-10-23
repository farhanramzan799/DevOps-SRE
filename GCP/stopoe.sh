# gcloud config set project PROJECT_NAME
echo "default-pool DOWN period started"
gcloud container clusters resize NAMESPACE --node-pool default-pool --size=0 --zone=us-central1-a -q
echo "default-pool is DOWN now"
echo "order-service DOWN period started"
gcloud container clusters resize NAMESPACE --node-pool order-service-pool --size=0 --zone=us-central1-a -q
echo "order-service is DOWN now"
echo "scheduler-pool DOWN period started"
gcloud container clusters resize NAMESPACE --node-pool scheduler-pool --size=0 --zone=us-central1-a -q
echo "scheduler-pool is DOWN now"
echo "reconciliation-pool DOWN period started"
gcloud container clusters resize NAMESPACE --node-pool reconciliation-pool --size=0 --zone=us-central1-a -q
echo "reconciliation-pool is DOWN now"
echo "ignite-cluster-pool DOWN period started"
gcloud container clusters resize NAMESPACE --node-pool ignite-cluster-pool --size=0 --zone=us-central1-a -q
gcloud container clusters resize NAMESPACE --node-pool ignite-pool --size=0 --zone=us-central1-a -q
echo "ignite-cluster-pool is DOWN now"
echo "active-nginx-pool DOWN period started"
gcloud container clusters resize NAMESPACE --node-pool active-nginx --size=0 --zone=us-central1-a -q
echo "active-nginx-pool is DOWN now"
