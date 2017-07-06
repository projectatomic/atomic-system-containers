FROM registry.fedoraproject.org/fedora:rawhide

ENV container=docker FLANNELD_ETCD_ENDPOINTS="http://127.0.0.1:2379" FLANNELD_ETCD_PREFIX="/atomic.io/network"

ENV VERSION=0.1 RELEASE=8 ARCH=x86_64
LABEL com.redhat.component="flannel" \
      name="$FGC/flannel" \
      version="$VERSION" \
      release="$RELEASE.$DISTTAG" \
      architecture="$ARCH" \
      summary="An etcd driven address agent, intended to be run as a system container" \
      maintainer="Giuseppe Scrivano <gscrivan@redhat.com>" \
      atomic.type='system'

RUN dnf -y --setopt=tsflags=nodocs install flannel && dnf clean all

ADD flanneld-run.sh /usr/bin/

RUN mkdir -p /exports/hostfs/etc/sysconfig/ && cp /etc/sysconfig/flanneld /exports/hostfs/etc/sysconfig/
RUN mkdir -p /exports/hostfs/etc/flanneld

# System container files
COPY tmpfiles.template service.template manifest.json \
     config.json.template /exports/

CMD ["/usr/bin/flanneld-run.sh"]
