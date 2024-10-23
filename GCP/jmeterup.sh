echo "default-pool UP period started"
gcloud container clusters resize jmeter --node-pool default-pool --size=1 --zone=us-central1-a -q
echo "default-pool is UP now"
echo "jmeter-slave-nodepool UP period started"
gcloud container clusters resize jmeter --node-pool jmeter-slave-nodepool --size=3 --zone=us-central1-a -q
echo "jmeter-slave-nodepool	is UP now"
