#!/bin/bash
# Install scriptlet for ovirt/rhevm-guest-agent

prefix=/host

# Add the ovirtagent user and group
hostgroup=`nsenter --mount=/host/proc/1/ns/mnt -- getent group ovirtagent`
echo "Host group is ${hostgroup}"
if [ "${hostgroup}" == "" ]; then
	echo "Creating ovirtagent group on host system"
	nsenter --mount=/host/proc/1/ns/mnt -- groupadd -r -g 175 ovirtagent
fi


hostuser=`nsenter --mount=/host/proc/1/ns/mnt -- getent passwd ovirtagent`
echo "Host user is ${hostuser}"
if [ "${hostuser}" == "" ]; then
	echo "Creating ovirtagent user on host system"
	nsenter --mount=/host/proc/1/ns/mnt -- useradd -r -g 175 ovirtagent -c "oVirt Guest Agent" -d /usr/share/ovirt-guest-agent -s /sbin/nologin
fi

