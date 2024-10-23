# ------------------------------SCALE-UP------------------------------------
kubectl scale deployments --all --replicas=1 --namespace istio-system
# kubectl scale deployments --all --replicas=1 --namespace knative-serving
kubectl scale deployments --all --replicas=1 --namespace NAMESPACE

# ------------------------------SCALE-DOWN------------------------------------
kubectl scale deployments --all --replicas=0 --namespace NAMESPACE
kubectl scale deployments --all --replicas=0 --namespace istio-system
# kubectl scale deployments --all --replicas=0 --namespace knative-serving
