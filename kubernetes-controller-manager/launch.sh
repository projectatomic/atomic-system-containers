#!/bin/bash

source /etc/kubernetes/controller-manager
source /etc/kubernetes/config

ARGS="$@ $KUBE_LOGTOSTDERR $KUBE_LOG_LEVEL $KUBE_MASTER $KUBE_CONTROLLER_MANAGER_ARGS"

exec /usr/bin/kube-controller-manager $ARGS
