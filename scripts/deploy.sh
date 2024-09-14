#
# Deploys the Node.js microservice to Kubernetes.
#
# Assumes the image has already been built and published to the container registry.
#
# Environment variables:
#
#   CONTAINER_REGISTRY - The hostname of your container registry.
#   VERSION - The version number of the image to deploy.
#
# Usage:
#
#   ./scripts/deploy.sh
#

#!/bin/bash

set -u # or set -o nounset

# Set these variables explicitly
CONTAINER_REGISTRY="assessment7acr.azurecr.io"
VERSION="latest"

# Ensure that the variables are set
: "$CONTAINER_REGISTRY"
: "$VERSION"

# Substitute the variables in the YAML and apply the configuration to Kubernetes
envsubst < ./scripts/kubernetes/deploy.yaml | kubectl apply -f -