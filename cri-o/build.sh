#!/bin/sh

export GOPATH=/root/go && export PATH=$PATH:/usr/local/go/bin:/root/go/bin

mkdir -p /root/go/src

wget https://storage.googleapis.com/golang/go1.7.4.linux-amd64.tar.gz && tar -xvf go1.7.4.linux-amd64.tar.gz -C /usr/local/

go get -d github.com/kubernetes-incubator/cri-o

cd $GOPATH/src/github.com/kubernetes-incubator/cri-o

make install.tools && make && make install && make install.config

cp $GOPATH/src/github.com/kubernetes-incubator/cri-o/crioctl /usr/bin/

mkdir -p /exports/hostfs/usr/bin && cp /usr/bin/crioctl /exports/hostfs/usr/bin/crioctl

mkdir -p /exports/hostfs/etc/ && cp -r /etc/crio/ /exports/hostfs/etc/crio/
