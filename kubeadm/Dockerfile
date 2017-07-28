FROM registry.fedoraproject.org/fedora:rawhide

ENV NAME=kubeadm VERSION=0 RELEASE=0 ARCH=x86_64
LABEL   bzcomponent="$NAME" \
        name="$FGC/$NAME" \
        version="$VERSION" \
        release="$RELEASE.$DISTTAG" \
        architecture="$ARCH" \
        atomic.type="system" \
        maintainer="Jason Brooks <jbrooks@redhat.com>"

RUN dnf install -y --setopt=tsflags=nodocs docker iproute kubernetes-kubeadm kubernetes-node kubernetes-client containernetworking-cni ethtool ebtables && dnf clean all

LABEL RUN /usr/bin/docker run -d --privileged --net=host --pid=host -v /:/rootfs:ro -v /sys:/sys:rw -v /var/run:/var/run:rw -v /run:/run:rw -v /var/lib/docker:/var/lib/docker:rw -v /var/lib/kubelet:/var/lib/kubelet:slave -v /var/log/containers:/var/log/containers:rw

COPY launch.sh /usr/bin/

COPY service.template config.json.template /exports/

RUN mkdir -p /exports/hostfs/usr/local/bin/ && cp /usr/bin/{kubectl,kubeadm} /exports/hostfs/usr/local/bin/
RUN mkdir -p /exports/hostfs/etc/{kubernetes,cni}
RUN mkdir -p /exports/hostfs/etc/kubernetes/pki
RUN mkdir -p /var/lib/kubelet

# pluck out env vars from kubeadm drop-in and put them into a user-editable location

RUN cat /etc/systemd/system/kubelet.service.d/kubeadm.conf | grep Environment | sed 's/Environment="//g' | sed 's/\=/\=\"/' > /exports/hostfs/etc/kubernetes/kubeadm-env

ENTRYPOINT ["/usr/bin/launch.sh"]
