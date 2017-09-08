FROM registry.fedoraproject.org/fedora:26

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

RUN dnf install --setopt=tsflags=nodocs -y iptables cri-o iproute runc && \
    rpm -V iptables cri-o iproute runc && \
    dnf clean all && \
    mkdir -p /exports/hostfs/etc/crio /exports/hostfs/opt/cni/bin/ && \
    cp /etc/crio/* /exports/hostfs/etc/crio && \
    if test -e /opt/cni/bin; then cp -Lr /opt/cni/bin/* /exports/hostfs/opt/cni/bin/; fi

COPY tmpfiles.template config.json.template service.template /exports/

COPY set_mounts.sh /
COPY run.sh /usr/bin/

CMD ["/usr/bin/run.sh"]
