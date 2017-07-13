FROM registry.fedoraproject.org/fedora:25

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

RUN dnf -y --setopt=tsflags=nodocs install btrfs-progs-devel device-mapper-devel glib2-devel glibc-devel glibc-static gpgme-devel libassuan-devel libgpg-error-devel libseccomp-devel libselinux-devel \
    pkgconfig runc wget git findutils gcc iptables skopeo && \
    dnf clean all

COPY tmpfiles.template config.json.template service.template /exports/

COPY build.sh run.sh /usr/bin/

RUN /usr/bin/build.sh

CMD ["/usr/bin/run.sh"]
