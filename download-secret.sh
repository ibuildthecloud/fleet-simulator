#!/bin/bash

kubectl apply -f - << EOF
kind: Bundle
apiVersion: fleet.cattle.io/v1alpha1
metadata:
    name: simulator-token
    namespace: simulator-runners
spec:
  resources:
  - content: |
        kind: Secret
        apiVersion: v1
        metadata:
          name: fleet-agent-bootstrap
          namespace: fleet-simulator
        data:
          values: "$(kubectl -n simulator-clusters get secret token -o 'jsonpath={.data.values}')"
  targets:
  - clusterSelector: {}
EOF
