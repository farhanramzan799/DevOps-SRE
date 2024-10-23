#!/bin/bash
if [ -z "$4" ]; then
    echo "incomplete params"
    echo "./update.sh <project> <cluster> <size> <zone>"
    exit 1
fi
project=$1
cluster=$2
size=$3
zone=$4
echo "updating "$project"/"$cluster" cluster size to "$size
echo "Setting Project:"$project
gcloud config set project $project
echo "Listing All Clusters"
gcloud container clusters list --zone=us-central1-a
echo "Setting Cluster:"$cluster
gcloud config set container/cluster $cluster
echo "Listing Cluster Node Pools Details"
gcloud container node-pools --zone=$zone  list
echo "Listing Cluster Node Pools Name"
gcloud container node-pools --zone=$zone  list | awk '{print $1}'
echo "Creating Cluster Node Pools Name list"
nodes=($(gcloud container node-pools --zone=$zone  list | awk '{print $1}'))
echo "Printing Name List"
for (( i=1; i<${#nodes[@]}; i++ ));
do
 echo ${nodes[i]};
done
for (( i=1; i<${#nodes[@]}; i++ ));
do
 echo "updating Node Pool "${nodes[i]}" size to "$size
 gcloud container clusters resize $cluster --node-pool ${nodes[i]} --size=$size --zone=$zone -q
done
echo "All Done"
