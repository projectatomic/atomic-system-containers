#!/bin/sh

CHROOT=/var/lib/containers/docker-chroot
mount --make-rprivate /

test -e $CHROOT/ || mkdir -p $CHROOT/

if ! findmnt $CHROOT/ >/dev/null 2>&1; then
    mount --bind $CHROOT/ $CHROOT/
    mount --make-private $CHROOT/
fi

mkdir -p $CHROOT/{etc,proc,sys,var,lib/modules,usr,tmp,dev,run}

for i in bin sbin lib lib64
do
    test -h $CHROOT/$i && rm $CHROOT/$i
    test ! -d $CHROOT/$i && ln -s /usr/$i $CHROOT/$i
done

for i in dev etc proc sys usr/lib/modules tmp run
do
    /usr/bin/mount --rbind /$i $CHROOT/$i
    /usr/bin/mount --make-rslave $CHROOT/$i
done

if ! findmnt $CHROOT/var > /dev/null 2>&1; then
    /usr/bin/mount --make-rslave --bind /var $CHROOT/var
fi

# /usr is mounted from the container
/usr/bin/mount --make-slave --read-only --bind $1/usr $CHROOT/usr
