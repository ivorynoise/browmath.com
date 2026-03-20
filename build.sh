#!/bin/bash
set -e

# Script to build and push Browmath Docker image
# Usage: ./build.sh <version>

if [ -z "$1" ]; then
  echo "Error: Version tag is required"
  echo "Usage: ./build.sh <version>"
  exit 1
fi

VERSION=$1
REGISTRY="central-harbor.ext.synthlane.com"
IMAGE_NAME="browmath"
FULL_IMAGE="${REGISTRY}/${IMAGE_NAME}:${VERSION}"

echo "=========================================="
echo "Building Browmath Docker Image"
echo "=========================================="
echo "Version: ${VERSION}"
echo "Image: ${FULL_IMAGE}"
echo ""

# Build the Docker image
echo "Step 1: Building Docker image..."
docker build -t "${FULL_IMAGE}" .

if [ $? -ne 0 ]; then
  echo "❌ Docker build failed"
  exit 1
fi

echo "✅ Docker image built successfully"
echo ""

# Push the image to Harbor
echo "Step 2: Pushing image to Harbor Registry..."
docker push "${FULL_IMAGE}"

if [ $? -ne 0 ]; then
  echo "❌ Docker push failed"
  exit 1
fi

echo "✅ Docker image pushed successfully"
echo ""

echo "=========================================="
echo "Build Complete"
echo "=========================================="
echo "Image: ${FULL_IMAGE}"
