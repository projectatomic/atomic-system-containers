#!/bin/bash

(
    OPTIONS="-Lsd"
    . /etc/sysconfig/snmptrapd
    unset NOTIFY_SOCKET
    /usr/sbin/snmptrapd $OPTIONS -f
) &

OPTIONS="-LS0-6d"
. /etc/sysconfig/snmpd
exec /usr/sbin/snmpd $OPTIONS -f
