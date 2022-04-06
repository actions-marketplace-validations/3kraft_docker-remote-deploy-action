#!/usr/bin/env bash
set -e

ssh -o StrictHostKeyChecking=no -i $PRIVATE_KEY_FILE root@$DOCKER_HOST "docker login ghcr.io -u $REGISTRY_USER -p $REGISTRY_TOKEN"
ssh -o StrictHostKeyChecking=no -i $PRIVATE_KEY_FILE root@$DOCKER_HOST "docker stop $CONTAINER_NAME"
ssh -o StrictHostKeyChecking=no -i $PRIVATE_KEY_FILE root@$DOCKER_HOST "docker rm $CONTAINER_NAME"
ssh -o StrictHostKeyChecking=no -i $PRIVATE_KEY_FILE root@$DOCKER_HOST "docker run -d --name $CONTAINER_NAME -p $CONTAINER_PORTS $CONTAINER_ARGS $IMAGE_NAME:$TAG_NAME"
ssh -o StrictHostKeyChecking=no -i $PRIVATE_KEY_FILE root@$DOCKER_HOST "docker image prune -af"
