FROM fedora:25

ENV VERSION=0.1 RELEASE=1 ARCH=x86_64
LABEL BZComponent="etcd-docker" \
      Name="$FGC/etcd" \
      Version="$VERSION" \
      Release="$RELEASE" \
      Architecture="$ARCH" \
      Summary="A key-value store for shared configuration and service discovery." \
      Maintainer="Giuseppe Scrivano <gscrivan@redhat.com>"

RUN dnf -y --setopt=tsflags=nodocs install etcd hostname && \
    dnf clean all

COPY etcd-env.sh /usr/bin/etcd-env.sh
COPY install.sh  /usr/bin/install.sh
COPY uninstall.sh /usr/bin/uninstall.sh

COPY tmpfiles.template config.json.template service.template manifest.json /exports/

CMD ["/usr/bin/etcd-env.sh", "/usr/bin/etcd"]
