FROM registry.fedoraproject.org/fedora:rawhide
MAINTAINER "Jason Brooks" <jbrooks@redhat.com>

ENV NAME=kubernetes-node VERSION=0 RELEASE=0 ARCH=x86_64
LABEL bzcomponent="$NAME" \
        name="$FGC/$NAME" \
        version="$VERSION" \
        release="$RELEASE.$DISTTAG" \
        architecture="$ARCH"

RUN dnf -y update && dnf clean all
RUN dnf install -y kubernetes-node findutils && dnf clean all
