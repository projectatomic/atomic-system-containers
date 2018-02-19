FROM kubernetes-node:rawhide

ENV container=docker

ENV NAME=kubernetes-kubelet VERSION=0 RELEASE=8 ARCH=x86_64
LABEL bzcomponent="$NAME" \
        name="$FGC/$NAME" \
        version="$VERSION" \
        release="$RELEASE.$DISTTAG" \
        architecture="$ARCH" \
        atomic.type='system' \
        maintainer="Jason Brooks <jbrooks@redhat.com>"

# Containerized kubelet requires nsenter
RUN dnf install -y --setopt=tsflags=nodocs util-linux ethtool systemd-udev e2fsprogs xfsprogs && dnf clean all

LABEL RUN /usr/bin/docker run -d --privileged --net=host --pid=host -v /:/rootfs:ro -v /sys:/sys:rw -v /var/run:/var/run:rw -v /run:/run:rw -v /var/lib/docker:/var/lib/docker:rw -v /var/lib/kubelet:/var/lib/kubelet:slave -v /var/log/containers:/var/log/containers:rw

COPY launch.sh /usr/bin/kubelet-docker.sh

COPY manifest.json tmpfiles.template service.template config.json.template /exports/

RUN mkdir -p /exports/hostfs/etc/cni/net.d && \
    mkdir -p /exports/hostfs/etc/kubernetes && \
    cp /etc/kubernetes/{config,kubelet} /exports/hostfs/etc/kubernetes

ENTRYPOINT ["/usr/bin/kubelet-docker.sh"]
