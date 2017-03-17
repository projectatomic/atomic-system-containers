#!/bin/bash

# set storage first
(
    . /etc/sysconfig/docker-storage-setup
    /usr/bin/docker-storage-setup
)

source /run/docker-bash-env

exec /usr/bin/docker-current daemon \
          --exec-opt native.cgroupdriver=systemd \
          $OPTIONS \
          $DOCKER_STORAGE_OPTIONS \
          $DOCKER_NETWORK_OPTIONS \
          $INSECURE_REGISTRY $ADD_REGISTRY \
          $BLOCK_REGISTRY
