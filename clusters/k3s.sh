#!/bin/bash

>k3s.yaml

for i in $(seq -f '%05g' 1 2); do
    for j in $(seq 1 2); do
        cat >> k3s.yaml << EOF
---
kind: K3s
apiVersion: k3s.ibtc.io/v1
metadata:
  name: simulator-${i}-${j}
  namespace: fleet-default

---
kind: Cluster
apiVersion: rancher.cattle.io/v1
metadata:
  name: simulator-${i}-${j}
  namespace: fleet-default
  labels:
    workspace: "workspace-$i"
    count: "$j"
spec:
  importedConfig:
    kubeConfigSecret: simulator-${i}-${j}-kubeconfig
EOF
    done
done
