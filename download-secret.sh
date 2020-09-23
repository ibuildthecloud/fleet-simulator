#!/bin/bash

cat > runners/secret.yaml << EOF
kind: Secret
apiVersion: v1
metadata:
  name: fleet-agent-bootstrap
  namespace: fleet-simulator
data:
  values: "$(kubectl -n simulator-clusters get secret token -o 'jsonpath={.data.values}')"
EOF
