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

COPY tmpfiles.template config.json.template service.template /exports/

COPY build.sh run.sh /usr/bin/

RUN /usr/bin/build.sh

CMD ["/usr/bin/run.sh"]
