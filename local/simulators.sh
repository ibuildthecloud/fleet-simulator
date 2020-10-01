#!/bin/bash

>simulators.yaml

for i in \
    $(seq 2); do
ns=simulator-$i
cat >> simulators.yaml << EOF
---
kind: GitRepo
apiVersion: fleet.cattle.io/v1alpha1
metadata:
  name: simulator-$i
  namespace: fleet-local
spec:
  targetNamespace: $ns
  repo: https://github.com/ibuildthecloud/fleet-simulator
  paths:
  - simulator-workspace
EOF
done
