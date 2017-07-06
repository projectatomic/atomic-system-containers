#!/bin/bash

# Ensure that new process maintain this SELinux label
PID=$$
LABEL=`tr -d '\000' < /proc/$PID/attr/current`
printf %s $LABEL > /proc/self/attr/exec

source /run/docker-bash-env

# set storage first
(
    . /etc/sysconfig/docker-storage-setup
    /usr/bin/docker-storage-setup
)

getent group docker || groupadd docker


# Inhibit sd-notify for docker-containerd, we want to get the notification
# from the docker process
NOTIFY_SOCKET=/dev/null /usr/libexec/docker/docker-containerd-current \
    --listen unix:///run/containerd.sock      \
    --shim /usr/bin/shim.sh &

while test \! -e /run/containerd.sock;
do
      sleep 0.1
done

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
     --config-file=/etc/docker/container-daemon.json \
     $OPTIONS \
     $DOCKER_STORAGE_OPTIONS \
     $DOCKER_NETWORK_OPTIONS \
     $ADD_REGISTRY \
     $BLOCK_REGISTRY \
     $INSECURE_REGISTRY
