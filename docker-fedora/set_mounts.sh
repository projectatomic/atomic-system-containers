#!/bin/sh

findmnt /var/lib > /dev/null || mount --bind --make-shared /var/lib /var/lib
mount --make-shared /run
