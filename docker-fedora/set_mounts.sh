#!/bin/sh

findmnt /var/lib/docker > /dev/null || mount --bind --make-shared /var/lib/docker /var/lib/docker
mount --make-shared /run
