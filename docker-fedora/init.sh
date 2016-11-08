#!/bin/sh

# set storage first
(
    . /etc/sysconfig/docker-storage-setup
    /usr/bin/docker-storage-setup
)

for i in /etc/sysconfig/{docker,docker-storage,docker-network}; do
    test -e $i && . $i
done

export GOTRACEBACK=crash

exec /usr/bin/docker daemon --exec-opt native.cgroupdriver=systemd \
          $OPTIONS \
          $DOCKER_STORAGE_OPTIONS \
          $DOCKER_NETWORK_OPTIONS \
          $INSECURE_REGISTRY
