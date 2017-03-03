FROM fedora:rawhide

LABEL maintainer="Giuseppe Scrivano <gscrivan@redhat.com>"

RUN dnf install -y docker container-selinux cloud-utils-growpart python-docker-py docker-novolume-plugin lvm2 iptables procps-ng xz inotify-tools && mkdir -p /usr/lib/modules && dnf clean all

RUN ln -s /usr/libexec/docker/docker-runc-current /usr/bin/docker-runc

COPY shim.sh init.sh /usr/bin/

# system container
COPY set_mounts.sh /
COPY config.json.template service.template tmpfiles.template /exports/

CMD ["/usr/bin/init.sh"]
