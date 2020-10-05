#!/bin/bash

REGISTRY_URL="hub.docker.com"

echo "Using registry: $REGISTRY_URL"
echo -n "Email: "
read REGISTRY_EMAIL
echo -n "Username: "
read REGISTRY_USERNAME
echo ""
echo -n "Password: "
read -s REGISTRY_PASSWORD
echo ""

kubectl create secret -n test-deployment docker-registry regcred \
  --docker-server="$REGISTRY_URL" \
  --docker-username="$REGISTRY_USERNAME" \
  --docker-password="$REGISTRY_PASSWORD" \
  --docker-email="$REGISTRY_EMAIL"  \
  -o yaml > regcred.yml
