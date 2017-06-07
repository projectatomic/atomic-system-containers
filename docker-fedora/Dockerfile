FROM registry.fedoraproject.org/fedora:rawhide

ENV VERSION=0 RELEASE=1 ARCH=x86_64
LABEL com.redhat.component="container-engine" \
      name="$FGC/container-engine" \
      version="$VERSION" \
      release="$RELEASE.$DISTTAG" \
      architecture="$ARCH" \
      usage="atomic install --system --system-package=no container-engine && systemctl start container-engine" \
      summary="The docker container engine as a system container." \
      maintainer="Giuseppe Scrivano <gscrivan@redhat.com>" \
      atomic.type="system"

RUN dnf install --setopt=tsflags=nodocs -y docker container-storage-setup container-selinux cloud-utils-growpart python-docker-py docker-novolume-plugin lvm2 iptables procps-ng xz oci-register-machine \
    && rpm -V docker container-storage-setup container-selinux cloud-utils-growpart python-docker-py docker-novolume-plugin lvm2 iptables procps-ng xz oci-register-machine \
    && mkdir -p /usr/lib/modules && dnf clean all

RUN ln -s /usr/libexec/docker/docker-runc-current /usr/bin/docker-runc

COPY README.md /
COPY shim.sh init.sh /usr/bin/

# system container
COPY set_mounts.sh /
COPY config.json.template service.template tmpfiles.template /exports/
COPY daemon.json /exports/hostfs/etc/docker/container-daemon.json
# https://github.com/rhatdan/oci-umount/issues/2
COPY oci-umount.conf /exports/hostfs/etc/oci-umount.conf

CMD ["/usr/bin/init.sh"]
