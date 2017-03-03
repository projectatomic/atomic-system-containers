#!/bin/bash

CONTAINER_PID=$(/usr/libexec/docker/docker-runc-current state $1 | python -c 'import sys; import json; print(json.loads(sys.stdin.read())["pid"])')

if test -n "$CONTAINER_PID"; then
    WD=$(pwd)
    SHIM_PID=$(cat /proc/$CONTAINER_PID/status | grep PPid | awk '{print $2}')
    exec nsenter -C -F --wd=$WD -m -u -i -n -p -t $SHIM_PID /usr/libexec/docker/docker-containerd-shim-current $@
else
    exec systemd-run --slice $1 --scope -- /usr/libexec/docker/docker-containerd-shim-current $@
fi
