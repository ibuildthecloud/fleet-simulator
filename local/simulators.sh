#!/bin/bash

>simulators.yaml

for i in \
    $(seq 100); do
ns=simulator-$i
cat >> simulator.yaml << EOF
kind: GitRepo
apiVersion: fleet.cattle.io/v1alpha1
metadata:
  name: simulator
  namespace: fleet-local
spec:
  targetNamespace: $ns
  repo: https://github.com/ibuildthecloud/fleet-simulator
  paths:
  - simulator-workspace
EOF
done