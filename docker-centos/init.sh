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

# Inhibit sd-notify for docker-containerd, we want to get the notification
# from the docker process
NOTIFY_SOCKET=/dev/null /usr/bin/docker-containerd-current \
    --listen unix:///run/containerd.sock \
    --shim /usr/bin/docker-containerd-shim-current \
    --start-timeout 2m &

while test \! -e /run/containerd.sock;
do
      sleep 0.1
done

exec /usr/bin/docker-current daemon \
          --config-file=/etc/docker/daemon.json \
          --userland-proxy-path=/usr/libexec/docker/docker-proxy-current \
          $OPTIONS \
          $DOCKER_STORAGE_OPTIONS \
          $DOCKER_NETWORK_OPTIONS \
          $INSECURE_REGISTRY $ADD_REGISTRY \
          $BLOCK_REGISTRY
