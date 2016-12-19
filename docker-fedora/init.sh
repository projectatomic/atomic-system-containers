#!/bin/bash

# set storage first
(
    . /etc/sysconfig/docker-storage-setup
    /usr/bin/docker-storage-setup
)

source /run/docker-bash-env

# Run all the installed containers
mkdir -p /run/docker/plugins/
ls -1 /usr/libexec/docker/*plugin |  \
while read i;
do
    plugin=$(basename $i)
    test -e /run/docker/plugins/$plugin.sock || mkfifo /run/docker/plugins/$plugin.sock
    $i &
done

exec /usr/bin/dockerd-current \
     --add-runtime oci=/usr/libexec/docker/docker-runc-current \
     --default-runtime=oci \
     --containerd /run/containerd.sock \
     --exec-opt native.cgroupdriver=systemd \
     --userland-proxy-path=/usr/libexec/docker/docker-proxy-current \
     $OPTIONS \
     $DOCKER_STORAGE_OPTIONS \
     $DOCKER_NETWORK_OPTIONS \
     $ADD_REGISTRY \
     $BLOCK_REGISTRY \
     $INSECURE_REGISTRY
