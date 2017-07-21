#!/bin/sh

mount --make-shared /run
findmnt /var/lib > /dev/null || mount --bind --make-rslave /var/lib /var/lib
findmnt /run/systemd > /dev/null || mount --bind --make-rslave /run/systemd /run/systemd
