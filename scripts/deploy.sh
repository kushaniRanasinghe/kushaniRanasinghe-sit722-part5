#
# Deploys a microservice to Kubernetes.
#
# Assumes the image has already been built and published to the container registry.
#
# Environment variables:
#
#   CONTAINER_REGISTRY - The hostname of your container registry.
#   NAME - The name of the microservice to deploy.
#   VERSION - The version of the microservice being deployed.
#
# Usage:
#
#   ./scripts/cd/deploy.sh
#

if [ -z "$CONTAINER_REGISTRY" ]; then
  echo "Error: VERSION is not set."
  exit 1
fi

if [ -z "$VERSION" ]; then
  echo "Error: VERSION is not set."
  exit 1
fi

envsubst < ./scripts/kubernetes/deployment.yaml | kubectl apply -f -
