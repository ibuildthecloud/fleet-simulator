#!/bin/bash

>k3s.yaml

for i in $(seq 0 100); do
    cat >> k3s.yaml << EOF
---
kind: K3s
apiVersion: k3s.ibtc.io/v1
metadata:
  name: simulator-$i

---
kind: Cluster
apiVersion: rancher.cattle.io/v1alpha1
metadata:
  name: simulator-$i
  labels:
    workspace: workspace-$i
spec:
  importedConfig:
    kubeConfigSecret: simulator-$i-kubeconfig
EOF

done
