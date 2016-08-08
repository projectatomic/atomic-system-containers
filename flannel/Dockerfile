FROM fedora

MAINTAINER Giuseppe Scrivano <gscrivan@redhat.com>

RUN dnf install -y flannel && dnf clean all

COPY config.json.template manifest.json service.template /exports/

CMD ["/usr/bin/flanneld", "-etcd-endpoints=http://127.0.0.1:2379"]
