FROM fedora

MAINTAINER Giuseppe Scrivano <gscrivan@redhat.com>

RUN dnf install -y flannel && dnf clean all

ADD service.template /exports/service.template
ADD config.json /exports/config.json

CMD ["/usr/bin/flanneld", "-etcd-endpoints=http://127.0.0.1:2379"]
