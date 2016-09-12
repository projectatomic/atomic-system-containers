FROM fedora

MAINTAINER Giuseppe Scrivano <gscrivan@redhat.com>

ENV container=docker
ENV FLANNELD_ETCD_ENDPOINTS="http://127.0.0.1:2379"
ENV FLANNELD_ETCD_PREFIX="/atomic.io/network"

RUN dnf -y install flannel && dnf clean all

ADD flanneld-run.sh /usr/bin/

# System container files
ADD tmpfiles.template service.template manifest.json config.json.template /exports/

CMD ["/usr/bin/flanneld-run.sh"]
