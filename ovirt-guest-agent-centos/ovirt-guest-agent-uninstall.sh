#!/bin/bash
# Install scriptlet for rhevm-guest-agent

prefix=/host


nsenter --mount=/host/proc/1/ns/mnt -- systemctl stop ovirt-notify-session-shutdown
nsenter --mount=/host/proc/1/ns/mnt -- systemctl disable ovirt-notify-session-shutdown

/bin/cp /usr/local/bin/ovirt-notify-session-shutdown.service /host/lib/systemd/system
/bin/rm -rf /host/usr/share/ovirt-guest-agent-docker
/bin/rm -f /host/lib/systemd/system/ovirt-notify-session-shutdown.service

nsenter --mount=/host/proc/1/ns/mnt -- systemctl daemon-reload

