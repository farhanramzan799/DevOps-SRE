echo "MicroServices pods UP period started"
gcloud container clusters get-credentials REPO-stagingcluster --zone us-central1-a --project PROJECT_NAME

# MicroServices = Authz + ActiveMQ + 8 GRPC + 3 Others + 10 Transition + Redis + 
# Replenishment + RFM + Shopify + Analytics + ShopifyShippingRates
kubectl scale deployments authz-deployment --replicas=1 --namespace istio-system
kubectl scale deployments activemq --replicas=1 --namespace NAMESPACE
kubectl scale deployments REPO-customer-service-deployment --replicas=1 --namespace NAMESPACE
kubectl scale deployments REPO-booking-service-deployment --replicas=1 --namespace NAMESPACE
kubectl scale deployments REPO-brand-service-deployment --replicas=1 --namespace NAMESPACE
kubectl scale deployments REPO-order-service-deployment --replicas=1 --namespace NAMESPACE
kubectl scale deployments REPO-currency-service-deployment --replicas=1 --namespace NAMESPACE
kubectl scale deployments REPO-externaleventshandler-service-deployment --replicas=1 --namespace NAMESPACE
kubectl scale deployments REPO-inventorylocation-service-deployment --replicas=1 --namespace NAMESPACE
kubectl scale deployments REPO-internal-affairs-deployment --replicas=1 --namespace NAMESPACE
kubectl scale deployments REPO-reports-service-deployment --replicas=1 --namespace NAMESPACE
kubectl scale deployments REPO-searchorder-service-deployment --replicas=1 --namespace NAMESPACE
kubectl scale deployments REPO-posmonitoring-deployment --replicas=1 --namespace NAMESPACE
kubectl scale deployments REPO-newordertransition-service-deployment --replicas=1 --namespace NAMESPACE
kubectl scale deployments REPO-verifyordertransition-service-deployment --replicas=1 --namespace NAMESPACE
kubectl scale deployments REPO-assignordertransition-service-deployment --replicas=1 --namespace NAMESPACE
kubectl scale deployments REPO-approveordertransition-service-deployment --replicas=1 --namespace NAMESPACE
kubectl scale deployments REPO-bookordertransition-service-deployment --replicas=1 --namespace NAMESPACE
kubectl scale deployments REPO-processordertransition-service-deployment --replicas=1 --namespace NAMESPACE
kubectl scale deployments REPO-finalstatetransition-service-deployment --replicas=1 --namespace NAMESPACE
kubectl scale deployments REPO-reverseordertransition-service-deployment --replicas=1 --namespace NAMESPACE
kubectl scale deployments REPO-editordertransition-service-deployment --replicas=1 --namespace NAMESPACE
kubectl scale deployments REPO-redisclient-service-deployment --replicas=1 --namespace NAMESPACE
kubectl scale deployments REPO-onboarding-service-deployment --replicas=1 --namespace NAMESPACE
kubectl scale deployments replenishment-deployment --replicas=1 --namespace NAMESPACE
kubectl scale deployments rfm-marketing --replicas=1 --namespace NAMESPACE
kubectl scale deployments shopify-service --replicas=1 --namespace NAMESPACE
kubectl scale deployments analytics-dashboard-deployment --replicas=1 --namespace NAMESPACE
kubectl scale deployments shopify-shipping-rates --replicas=1 --namespace NAMESPACE
kubectl scale deployments dashboard-service-new-deployment --replicas=1 --namespace NAMESPACE

echo "MicroServices pods are UP now"
