#!/bin/sh

ipaddress=$(hostname -I | cut -f1 -d' ')
if test x$NAME == x; then
    NAME=$HOSTNAME
fi
export ETCD_NAME=${ETCD_NAME:-$HOSTNAME}
export ETCD_DATA_DIR=/var/lib/etcd/${NAME}.etcd

sed -i s/ETCD_NAME.*/ETCD_NAME=$ETCD_NAME/g /etc/etcd/etcd.conf
sed -i s/ETCD_DATA_DIR.*/ETCD_DATA_DIR=$ETCD_DATA_DIR/g /etc/etcd/etcd.conf

source /etc/etcd/etcd.conf

# Execute the commands passed to this script
exec "$@"
