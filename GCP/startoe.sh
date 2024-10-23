# gcloud config set project PROJECT_NAME
echo "order-service-pool UP period started"
# gcloud container clusters resize NAMESPACE --node-pool order-service-pool --size=1 --zone=us-central1-a -q
echo "order-service-pool is UP now"
echo "default-pool UP period started"
gcloud container clusters resize NAMESPACE --node-pool default-pool --size=1 --zone=us-central1-a -q
# gcloud container clusters resize NAMESPACE --node-pool default-pool --size=2 --zone=us-central1-a -q
echo "default-pool is UP now"
echo "reconciliation-pool UP period started"
# gcloud container clusters resize NAMESPACE --node-pool reconciliation-pool --size=1 --zone=us-central1-a -q
echo "reconciliation-pool is UP now"
echo "scheduler-pool UP period started"
# gcloud container clusters resize NAMESPACE --node-pool scheduler-pool --size=1 --zone=us-central1-a -q
echo "scheduler-pool is UP now"
