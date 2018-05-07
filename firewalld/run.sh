#!/bin/bash
OPTIONS="--nofork --nopid"
. /etc/sysconfig/firewalld
exec /usr/sbin/firewalld $OPTIONS
