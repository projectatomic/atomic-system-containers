#!/bin/bash

# set storage first
(
    . /etc/sysconfig/docker-storage-setup
    /usr/bin/docker-storage-setup
)

for i in /etc/sysconfig/{docker,docker-storage,docker-network}; do
    test -e $i && . $i
done

while read i; do
        echo EVAL $i
        test -e $i && source $i
done < <(sed -n -e "s/EnvironmentFile=-*// p" /etc/systemd/system/docker.service.d/*)

export GOTRACEBACK=crash

exec /usr/bin/docker-current daemon \
          $OPTIONS \
          $DOCKER_STORAGE_OPTIONS \
          $DOCKER_NETWORK_OPTIONS \
          $INSECURE_REGISTRY
