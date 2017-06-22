FROM kubernetes-node:rawhide
MAINTAINER "Jason Brooks" <jbrooks@redhat.com>

ENV container=docker

ENV NAME=kubernetes-kubelet VERSION=0 RELEASE=8 ARCH=x86_64
LABEL bzcomponent="$NAME" \
        name="$FGC/$NAME" \
        version="$VERSION" \
        release="$RELEASE.$DISTTAG" \
        architecture="$ARCH" \
        atomic.type='system'

# Containerized kubelet requires nsenter
RUN dnf install -y util-linux ethtool && dnf clean all

LABEL RUN /usr/bin/docker run -d --privileged --net=host --pid=host -v /:/rootfs:ro -v /sys:/sys:rw -v /var/run:/var/run:rw -v /run:/run:rw -v /var/lib/docker:/var/lib/docker:rw -v /var/lib/kubelet:/var/lib/kubelet:slave -v /var/log/containers:/var/log/containers:rw

COPY launch.sh /usr/bin/kubelet-docker.sh

COPY service.template config.json.template /exports/

RUN mkdir -p /exports/hostfs/etc/kubernetes && cp /etc/kubernetes/{config,kubelet} /exports/hostfs/etc/kubernetes

ENTRYPOINT ["/usr/bin/kubelet-docker.sh"]
