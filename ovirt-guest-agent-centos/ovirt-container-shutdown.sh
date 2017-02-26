#!/bin/bash

/usr/bin/nsenter --mount=/proc/1/ns/mnt -- /sbin/shutdown $@
