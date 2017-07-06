#!/bin/sh

ipaddress=$(hostname -I | cut -f1 -d' ')
if test x$NAME == x; then
    NAME=$HOSTNAME
fi
export ETCD_NAME=${ETCD_NAME:-$HOSTNAME}
export ETCD_DATA_DIR=/var/lib/etcd/${NAME}.etcd

source /etc/etcd/etcd.conf

# Execute the commands passed to this script
exec "$@"
