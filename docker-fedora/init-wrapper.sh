#!/usr/bin/bash

mkdir -p /run/docker

PID=`cat /run/docker/docker-wrapper.pid 2>/dev/null`
if ! `kill -0 $PID 2>/dev/null`; then
    truncate --size 0 /run/docker/docker-wrapper.pid
    unshare -m setup-keep-alive-process.sh &
fi

while test `wc -l < /run/docker/docker-wrapper.pid` -lt 1; do
    sleep 0.1
done

PID=`cat /run/docker/docker-wrapper.pid 2>/dev/null`

if test \! -e /proc/$PID/root/usr/bin; then
    mount-in-ns $PID /host/$DESTDIR/rootfs/usr /usr
    mount-in-ns $PID /usr/lib/modules /usr/lib/modules
fi

exec nsenter -F -m -t $PID /usr/bin/init.sh
