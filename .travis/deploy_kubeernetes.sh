#!/bin/sh

kubectl --insecure-skip-tls-verify=true apply -f deployment.yaml 
#kubectl --insecure-skip-tls-verify=true image deployment/cicdbuzz cicdbuzz=poggenpower/cicd-buzz:9