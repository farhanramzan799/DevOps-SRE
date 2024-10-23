echo "MicroServices pods UP period started"
gcloud container clusters get-credentials CLUSTER_NAME --zone us-central1-a --project PROJECT_NAME

# MicroServices = Authz + ActiveMQ + 8 GRPC + 3 Others + 10 Transition + Redis + 
# Replenishment + RFM + Shopify + Analytics + ShopifyShippingRates
kubectl scale deployments authz-deployment --replicas=1 --namespace istio-system
kubectl scale deployments activemq --replicas=1 --namespace NAMESPACE
kubectl scale deployments customer-service-deployment --replicas=1 --namespace NAMESPACE
kubectl scale deployments booking-service-deployment --replicas=1 --namespace NAMESPACE
kubectl scale deployments brand-service-deployment --replicas=1 --namespace NAMESPACE
kubectl scale deployments bi-engine-deployment --replicas=1 --namespace NAMESPACE
kubectl scale deployments order-service-deployment --replicas=1 --namespace NAMESPACE
echo "MicroServices pods are UP now."
