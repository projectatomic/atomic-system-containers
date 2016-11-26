#!/bin/sh

function cleanup {
   while test $(findmnt --list -R -o TARGET /host/var/lib/docker/devicemapper | wc -l) -gt 1; do
        umount -R /host/var/lib/docker || break
    done
    mount --rbind /var/lib/docker /host/var/lib/docker
}

trap cleanup EXIT

/usr/bin/init.sh &
PID=$!

# workaround an issue with deleting containers with mounts in other namespaces
ls -1 /var/lib/docker/containers | \
    while read i; do
        if test -e /var/lib/docker/containers/$i/shm && test \! -e /var/lib/docker/containers/$i/config.v2.json; then
            rm -rf /var/lib/docker/containers/$i >/dev/null 2>&1
        fi
    done

function interrupt {
    kill $PID
}

trap interrupt INT

wait $!
