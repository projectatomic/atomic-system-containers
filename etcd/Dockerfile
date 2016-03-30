FROM fedora

MAINTAINER Giuseppe Scrivano <gscrivan@redhat.com>

RUN dnf -y install etcd hostname && \
    dnf clean all

ADD etcd-env.sh /usr/bin/etcd-env.sh
ADD install.sh  /usr/bin/install.sh
ADD uninstall.sh /usr/bin/uninstall.sh

ADD service.template /exports/service.template
ADD config.json.template /exports/config.json.template

CMD ["/usr/bin/etcd-env.sh", "/usr/bin/etcd"]
