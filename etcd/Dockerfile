FROM registry.fedoraproject.org/fedora:rawhide

ENV VERSION=0.1 RELEASE=10 ARCH=x86_64
LABEL com.redhat.component="etcd" \
      name="$FGC/etcd" \
      version="$VERSION" \
      release="$RELEASE.$DISTTAG" \
      architecture="$ARCH" \
      summary="A key-value store for shared configuration and service discovery." \
      maintainer="Giuseppe Scrivano <gscrivan@redhat.com>"

RUN dnf -y --setopt=tsflags=nodocs install etcd hostname && \
    dnf clean all

LABEL INSTALL /usr/bin/docker run --rm \$OPT1 --privileged -v /:/host -e HOST=/host -e NAME=\$NAME -e IMAGE=\$IMAGE \$IMAGE \$OPT2 /usr/bin/install.sh  \$OPT3
LABEL UNINSTALL /usr/bin/docker run --rm \$OPT1 --privileged -v /:/host -e HOST=/host -e NAME=\$NAME -e IMAGE=\$IMAGE \$IMAGE \$OPT2 /usr/bin/uninstall.sh \$OPT3
LABEL RUN /usr/bin/docker run -d \$OPT1 -p 4001:4001 -p 7001:7001 -p 2379:2379 -p 2380:2380 --name \$NAME \$IMAGE \$OPT2 \$OPT3

COPY etcd-env.sh /usr/bin/etcd-env.sh
COPY install.sh  /usr/bin/install.sh
COPY uninstall.sh /usr/bin/uninstall.sh

COPY tmpfiles.template config.json.template service.template manifest.json /exports/

RUN mkdir -p /exports/hostfs/usr/local/bin/ && cp /usr/bin/etcdctl /exports/hostfs/usr/local/bin/etcdctl

# RUN mkdir -p /exports/hostfs/usr/local/bin/ && echo "runc exec -- etcd /usr/bin/etcdctl \$@" \
# > /exports/hostfs/usr/local/bin/etcdctl && chmod +x /exports/hostfs/usr/local/bin/etcdctl

RUN mkdir -p /exports/hostfs/etc/etcd && cp /etc/etcd/etcd.conf /exports/hostfs/etc/etcd

EXPOSE 4001 7001 2379 2380

CMD ["/usr/bin/etcd-env.sh", "/usr/bin/etcd"]
