#!/bin/sh

mount --make-shared /run
findmnt /run/systemd > /dev/null || mount --bind --make-rslave /run/systemd /run/systemd
