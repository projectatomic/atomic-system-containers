FROM centos

ENV VERSION=0 RELEASE=1 ARCH=x86_64
LABEL com.redhat.component="cri-o" \
      name="$FGC/cri-o" \
      version="$VERSION" \
      release="$RELEASE.$DISTTAG" \
      architecture="$ARCH" \
      usage="atomic install --system --system-package=no crio && systemctl start crio" \
      summary="The cri-o daemon as a system container." \
      maintainer="Yu Qi Zhang <jzehrarnyg@gmail.com>" \
      atomic.type="system"

COPY tmpfiles.template config.json.template service.template /exports/

RUN yum-config-manager --nogpgcheck --add-repo https://cbs.centos.org/repos/virt7-docker-common-candidate/x86_64/os/ && \
    yum install --nogpgcheck --setopt=tsflags=nodocs -y cri-o cri-o-cni && \
    yum clean all && \
    mkdir -p /exports/hostfs/etc/crio /exports/hostfs/opt/cni/bin/ && \
    cp /etc/crio/* /exports/hostfs/etc/crio && \
    if test -e /opt/cni/bin; then cp -Lr /opt/cni/bin/* /exports/hostfs/opt/cni/bin/; fi

COPY set_mounts.sh /
COPY run.sh /usr/bin/

CMD ["/usr/bin/run.sh"]
