echo "default-pool DOWN period started"
gcloud container clusters resize jmeter --node-pool default-pool --size=0 --zone=us-central1-a -q
echo "default-pool is DOWN now"
echo "jmeter-slave-nodepool DOWN period started"
gcloud container clusters resize jmeter --node-pool jmeter-slave-nodepool --size=0 --zone=us-central1-a -q
echo "jmeter-slave-nodepool	is DOWN now"
