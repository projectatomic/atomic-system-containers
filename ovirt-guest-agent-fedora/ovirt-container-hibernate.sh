#!/bin/bash

/usr/bin/nsenter --mount=/proc/1/ns/mnt -- /usr/share/ovirt-guest-agent/hibernate $@
