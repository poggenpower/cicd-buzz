#!/bin/sh
pwd
DOCKER_IMAGE=$(cat ../docker_image.txt)
sed "s#image: poggenpower/cicd-buzz:latest#image: ${DOCKER_USER}/${DOCKER_IMAGE}#" deployment.yaml > deployment.tmp.yaml
kubectl --insecure-skip-tls-verify=true apply -f deployment.tmp.yaml 