FROM fedora

MAINTAINER Giuseppe Scrivano <gscrivan@redhat.com>

ENV container=docker
ENV FLANNELD_ETCD_ENDPOINTS="http://127.0.0.1:2379"
ENV FLANNELD_ETCD_PREFIX="/atomic.io/network"

ENV VERSION=0.1 RELEASE=1 ARCH=x86_64
LABEL BZComponent="flannel-docker" \
      Name="$FGC/flannel" \
      Version="$VERSION" \
      Release="$RELEASE" \
      Architecture="$ARCH" \
      Summary="An etcd driven address agent, intended to be run as a system container" \
      atomic.type='system'

RUN dnf -y install flannel && dnf clean all

ADD flanneld-run.sh /usr/bin/

# System container files
COPY tmpfiles.template service.template manifest.json \
     config.json.template /exports/

CMD ["/usr/bin/flanneld-run.sh"]
