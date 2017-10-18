#!/bin/bash

[ -f /etc/kubernetes/kubeadm-env ] && source /etc/kubernetes/kubeadm-env
[ -f /etc/kubernetes/crio-env ] && source /etc/kubernetes/crio-env

TEMP_KUBELET_ARGS='--cgroups-per-qos=false --enforce-node-allocatable='

exec /usr/bin/kubelet $KUBELET_KUBECONFIG_ARGS $KUBELET_SYSTEM_PODS_ARGS $KUBELET_NETWORK_ARGS $KUBELET_DNS_ARGS $KUBELET_AUTHZ_ARGS $KUBELET_CADVISOR_ARGS $KUBELET_CGROUP_ARGS $KUBELET_CERTIFICATE_ARGS $KUBELET_EXTRA_ARGS $TEMP_KUBELET_ARGS --containerized
