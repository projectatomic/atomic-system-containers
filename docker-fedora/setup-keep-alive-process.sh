#/usr/bin/bash

set -euo pipefail

# we are running in a new mount namespace, move ourselves in a tmpfs or we cannot access
# the container when the rootfs is deleted (for example on an update).

mkdir -p /run/docker/keep-alive
mount -t tmpfs tmpfs /run/docker/keep-alive
mkdir -p /run/docker/keep-alive/{old,usr,run}

cp -P /bin /lib /lib64 /sbin /run/docker/keep-alive

MOUNTS="dev proc sys"
MOUNTS_MOVEABLE="etc home mnt tmp root var/lib/docker host usr/share/rhel"

mount --bind /usr /run/docker/keep-alive/usr
mount --bind /run /run/docker/keep-alive/run

for i in $MOUNTS_MOVEABLE
do
    mkdir -p /run/docker/keep-alive/$i
    mount --move $i /run/docker/keep-alive/$i
done

mkdir -p /run/docker/keep-alive/var/run
mount --rbind  /var/run /run/docker/keep-alive/var/run

for i in $MOUNTS
do
    mkdir -p /run/docker/keep-alive/$i
    mount --bind $i /run/docker/keep-alive/$i
done

cd /run/docker/keep-alive

pivot_root . old

mount --move old/sys /sys
mount --move old/proc /proc
mount --move old/dev /dev
mount --move old/run /run

# /usr/lib/modules comes from the host
mount --bind /host/usr/lib/modules /usr/lib/modules

echo $BASHPID > /run/docker/docker-wrapper.pid

# keep alive process to use to later join the same mount namespace
exec systemd-run --no-block --scope -q inotifywait -e delete_self /var/lib/docker/containers >/dev/null 2>&1
