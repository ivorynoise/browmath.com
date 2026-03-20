#!/bin/bash
set -e

REGISTRY="central-harbor.ext.synthlane.com/internal"
IMAGE_NAME="browmath-com"

# Ensure we run from this project root
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Build latest image
echo "Building Docker image..."
docker build -t "$REGISTRY/$IMAGE_NAME:latest" .

# Get tag from argument or prompt
if [ -n "$1" ]; then
    TAG="$1"
else
    echo "Check this https://central-harbor.ext.synthlane.com/harbor/projects/2/repositories/$IMAGE_NAME/artifacts-tab"
    read -p "Enter tag to push (e.g., 1.0.0-dev, or 'skip' to skip pushing): " TAG
fi

if [ "$TAG" = "skip" ]; then
    echo "Skipping push."
    exit 0
fi

# Retag with version
docker tag "$REGISTRY/$IMAGE_NAME:latest" "$REGISTRY/$IMAGE_NAME:$TAG"

# Push both tags
echo "Pushing images..."
docker push "$REGISTRY/$IMAGE_NAME:latest"
docker push "$REGISTRY/$IMAGE_NAME:$TAG"

echo "Done! Pushed:"
echo "  - $REGISTRY/$IMAGE_NAME:latest"
echo "  - $REGISTRY/$IMAGE_NAME:$TAG"
