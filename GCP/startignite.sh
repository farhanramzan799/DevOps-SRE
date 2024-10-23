# gcloud config set project PROJECT_NAME
echo "active-nginx-pool UP period started"
# gcloud container clusters resize NAMESPACE --node-pool active-nginx --size=1 --zone=us-central1-a -q
echo "active-nginx-pool is UP now"
echo "ignite-cluster-pool UP period started"
# gcloud container clusters resize NAMESPACE --node-pool ignite-cluster-pool --size=1 --zone=us-central1-a -q
gcloud container clusters resize NAMESPACE --node-pool ignite-pool --size=1 --zone=us-central1-a -q
echo "ignite-cluster-pool is UP now"
