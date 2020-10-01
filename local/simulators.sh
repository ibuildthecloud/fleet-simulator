#!/bin/bash

>simulators.yaml

for workspace in $(seq -f '%05g' 1 50); do
    for count in $(seq 0 20); do
        cat >> simulators.yaml << EOF
---
kind: GitRepo
apiVersion: fleet.cattle.io/v1alpha1
metadata:
  name: simulator-${workspace}-${count}
  namespace: fleet-local
spec:
  targetNamespace: simulator-${workspace}-${count}
  name: simulator-${workspace}-${count}
  repo: https://github.com/ibuildthecloud/fleet-simulator
  paths:
  - simulator-workspace
EOF
    done
done
