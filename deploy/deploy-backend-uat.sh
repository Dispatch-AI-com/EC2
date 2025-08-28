#!/usr/bin/env bash
set -euo pipefail

REGION="ap-southeast-2"
PROJECT="dispatchai-uat"
IMAGE_TAG="${1:?Usage: deploy-backend-uat.sh <image-tag>}"

# Parameter Store
PREFIX="/dispatchai/uat/backend-api/env/"

#######################################################
# Fetch environment variables from parameter store
#######################################################
aws ssm get-parameters-by-path \
  --region "$REGION" \
  --path "$PREFIX" \
  --recursive \
  --with-decryption \
  --query 'Parameters[].[Name,Value]' \
  --output json |
jq -r 'sort_by(.[0])[] | "\((.[0]|split("/")|last))=\(.[1])"' > .env.uat

echo "========================================================================"
echo "🚀 Deploying DispatchAI Backend Services using Image Tag:$IMAGE_TAG 🚀"
echo "========================================================================"
echo "Stopping and removing old containers (if any)..."
if ! docker compose -p "$PROJECT" down --remove-orphans; then
  echo "[WARN] No previous project found, skipping down."
fi

echo "----------------------------------------------"
echo "Pulling images ..."
IMAGE_TAG=$1 docker compose -p "$PROJECT" -f "docker-compose.uat.yml" pull

echo "----------------------------------------------"
echo "Starting new containers ..."
IMAGE_TAG=$1 docker compose -p "$PROJECT" -f "docker-compose.uat.yml" up -d --force-recreate

echo "========================================================================"
echo "✅ deployed successfully! ✅"
echo "========================================================================"

echo "Deleting unused images ..."
docker image prune -a -f
