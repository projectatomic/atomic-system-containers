#!/bin/sh

ipaddress=$(hostname -I | cut -f1 -d' ')
if test x$NAME == x; then
    NAME=$HOSTNAME
fi
export ETCD_NAME=${ETCD_NAME:-$HOSTNAME}
export ETCD_DATA_DIR=/var/lib/etcd/${NAME}.etcd

if test -e /etc/etcd/etcd.conf; then
    source /etc/etcd/etcd.conf
fi

# Execute the commands passed to this script
exec "$@"
