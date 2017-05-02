FROM fedora:rawhide

LABEL maintainer="Giuseppe Scrivano <gscrivan@redhat.com>" \
      name="docker-fedora" \
      version="0.1" \
      atomic.type="system" \
      architecture="x86_64"

RUN dnf install --setopt=tsflags=nodocs -y docker container-selinux cloud-utils-growpart python-docker-py docker-novolume-plugin lvm2 iptables procps-ng xz oci-register-machine \
    && rpm -V docker container-selinux cloud-utils-growpart python-docker-py docker-novolume-plugin lvm2 iptables procps-ng xz oci-register-machine \
    && mkdir -p /usr/lib/modules && dnf clean all

RUN ln -s /usr/libexec/docker/docker-runc-current /usr/bin/docker-runc

COPY shim.sh init.sh /usr/bin/

# system container
COPY set_mounts.sh /
COPY config.json.template service.template tmpfiles.template /exports/
COPY daemon.json /exports/hostfs/etc/docker/

CMD ["/usr/bin/init.sh"]
