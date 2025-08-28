#!/usr/bin/env bash
set -euo pipefail

# verify and pass imageTag
if [ $# -ne 1 ]; then
  echo "❌ Usage: $0 <imageTag>"
  exit 1
fi

ECR_URI="381492119078.dkr.ecr.ap-southeast-2.amazonaws.com/dispatchai-uat-frontend"
IMAGE_TAG=$1
CONTAINER_NAME="dispatchai-frontend-uat"
HOST_PORT=3000
CONTAINER_PORT=3000

echo "========================================================================================================================="
echo "🚀 Deploying $ECR_URI:$IMAGE_TAG 🚀"
echo "========================================================================================================================="
echo "Stopping and removing old container ..."
docker rm -f "$CONTAINER_NAME" 2>/dev/null || true

echo "Pulling $ECR_URI:$IMAGE_TAG ..."
docker pull "$ECR_URI:$IMAGE_TAG"

echo "Starting new container ..."
docker run -d --name "$CONTAINER_NAME" \
  -p ${HOST_PORT}:${CONTAINER_PORT} \
  --restart unless-stopped \
  "$ECR_URI:$IMAGE_TAG"

echo "========================================================================================================================="
echo "✅ deployed successfully! ✅"
echo "========================================================================================================================="

echo "Deleting unused images ..."
docker image prune -a -f
