FROM registry.fedoraproject.org/fedora:27

ENV VERSION=0 RELEASE=1 ARCH=x86_64
LABEL com.redhat.component="buildah" \
      atomic.run="once" \
      atomic.type="system"

RUN mkdir /exports /host && \
    dnf install --setopt=tsflags=nodocs -y buildah bwrap-oci && \
    dnf clean all

# system container
COPY config.json.template tmpfiles.template /exports/

CMD ["--help"]
ENTRYPOINT ["/usr/bin/buildah"]
