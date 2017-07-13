#!/bin/sh

dnf -y --setopt=tsflags=nodocs install btrfs-progs-devel device-mapper-devel glib2-devel glibc-devel glibc-static gpgme-devel libassuan-devel libgpg-error-devel libseccomp-devel libselinux-devel \
pkgconfig runc wget git findutils gcc iptables skopeo

export GOPATH=/root/go && export PATH=$PATH:/usr/local/go/bin:/root/go/bin

mkdir -p /root/go/src

wget https://storage.googleapis.com/golang/go1.7.4.linux-amd64.tar.gz && tar -xvf go1.7.4.linux-amd64.tar.gz -C /usr/local/

rm -f go1.7.4.linux-amd64.tar.gz

go get -d github.com/kubernetes-incubator/cri-o

cd $GOPATH/src/github.com/kubernetes-incubator/cri-o

make install.tools && make && make install && make install.config

cp $GOPATH/src/github.com/kubernetes-incubator/cri-o/crioctl /usr/bin/

mkdir -p /exports/hostfs/usr/bin && cp /usr/bin/crioctl /exports/hostfs/usr/bin/crioctl

mkdir -p /exports/hostfs/etc/ && cp -r /etc/crio/ /exports/hostfs/etc/crio/

rm -rf /usr/local/go

rm -rf $GOPATH

dnf remove -y btrfs-progs-devel device-mapper-devel glib2-devel glibc-devel glibc-static gpgme-devel libassuan-devel libgpg-error-devel libseccomp-devel libselinux-devel \
pkgconfig wget git findutils gcc && \
dnf clean all
