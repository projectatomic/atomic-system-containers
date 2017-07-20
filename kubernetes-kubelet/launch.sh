#!/bin/bash

source /etc/kubernetes/kubelet
source /etc/kubernetes/config

TEMP_KUBELET_ARGS='--cgroup-driver=systemd --cgroups-per-qos=false --enforce-node-allocatable='

ARGS="$@ $TEMP_KUBELET_ARGS $KUBE_LOGTOSTDERR $KUBE_LOG_LEVEL $KUBELET_API_SERVER $KUBELET_ADDRESS $KUBELET_PORT $KUBELET_HOSTNAME $KUBE_ALLOW_PRIV $KUBELET_ARGS"

exec /usr/bin/kubelet $ARGS --containerized
