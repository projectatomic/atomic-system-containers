FROM registry.fedoraproject.org/fedora:rawhide
MAINTAINER "Jason Brooks" <jbrooks@redhat.com>

ENV NAME=kubernetes-master VERSION=0 RELEASE=0 ARCH=x86_64
LABEL bzcomponent="$NAME" \
        name="$FGC/$NAME" \
        version="$VERSION" \
        release="$RELEASE.$DISTTAG" \
        architecture="$ARCH"

RUN dnf -y update && dnf clean all
RUN groupadd -g 994 kube && useradd -u 996 -g 994 kube
RUN dnf install -y kubernetes-master findutils && dnf clean all
