#!/bin/sh

CHROOT=/var/lib/containers/docker-chroot

# do not umount /var
for i in dev etc proc sys usr usr/lib/modules tmp run; do
    /usr/bin/umount -lR $CHROOT/$i
done
