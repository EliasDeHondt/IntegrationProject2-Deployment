#!/bin/bash

POD_NAME=$(kubectl get pods -l app=elasticsearch-master -o jsonpath='{.items[0].metadata.name}')
TARGET_DIR=./certs

echo "Copying certificates from Elasticsearch pod..."
kubectl cp $POD_NAME:/usr/share/elasticsearch/config/certs $TARGET_DIR

echo "Creating Kubernetes secret from certificates..."
kubectl create secret generic elasticsearch-certificates \
  --from-file=ca.crt=$TARGET_DIR/ca/ca.crt \
  --from-file=instance.crt=$TARGET_DIR/instance/instance.crt \
  --from-file=instance.key=$TARGET_DIR/instance/instance.key

echo "Secret 'elasticsearch-certificates' created successfully."
exit 0