#!/bin/sh
exec systemd-run --scope -q /usr/libexec/docker/docker-containerd-shim-current $@
