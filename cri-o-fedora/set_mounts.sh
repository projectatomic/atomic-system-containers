#!/bin/sh

findmnt /var/lib/containers > /dev/null || mount --bind --make-shared /var/lib/containers /var/lib/containers
findmnt /var/lib/origin > /dev/null || mount --bind --make-shared /var/lib/origin /var/lib/origin
mount --make-shared /run
findmnt /run/systemd > /dev/null || mount --bind --make-rslave /run/systemd /run/systemd
