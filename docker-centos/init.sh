#!/bin/bash

# set storage first
(
    . /etc/sysconfig/docker-storage-setup
    /usr/bin/docker-storage-setup
)

. /run/docker-env

exec /usr/bin/docker-current daemon \
          $OPTIONS \
          $DOCKER_STORAGE_OPTIONS \
          $DOCKER_NETWORK_OPTIONS \
          $INSECURE_REGISTRY
