# Fetch the latest release version of retina from GitHub
$VERSION = (Invoke-RestMethod -Uri https://api.github.com/repos/microsoft/retina/releases/latest).name

# Execute the Helm upgrade or install command with the retrieved version
helm upgrade --install --kube-context <CLUSTER_NAME> retina oci://ghcr.io/microsoft/retina/charts/retina `
    --version $VERSION `
    --namespace kube-system `
    --set image.tag=$VERSION `
    --set operator.tag=$VERSION `
    --set image.pullPolicy=Always `
    --set logLevel=info `
    --set os.windows=true `
    --set operator.enabled=true `
    --set operator.enableRetinaEndpoint=true `
    --skip-crds `
    --set enabledPlugin_linux="[dropreason,packetforward,linuxutil,dns,packetparser]" `
    --set enablePodLevel=true `
    --set enableAnnotations=true
