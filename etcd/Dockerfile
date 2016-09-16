FROM fedora

MAINTAINER Giuseppe Scrivano <gscrivan@redhat.com>

RUN dnf -y install etcd hostname && \
    dnf clean all

COPY etcd-env.sh /usr/bin/etcd-env.sh
COPY install.sh  /usr/bin/install.sh
COPY uninstall.sh /usr/bin/uninstall.sh

COPY tmpfiles.template config.json.template service.template manifest.json /exports/

CMD ["/usr/bin/etcd-env.sh", "/usr/bin/etcd"]
