FROM fedora:rawhide
MAINTAINER Giuseppe Scrivano <gscrivan@redhat.com>

RUN dnf install -y docker container-selinux cloud-utils-growpart python-docker-py docker-novolume-plugin lvm2 iptables procps-ng xz inotify-tools && mkdir -p /usr/lib/modules && dnf clean all

ADD shim.sh init.sh /usr/bin/

# system container
ADD set_environment.sh unset_environment.sh /
COPY service.template tmpfiles.template /exports/

CMD ["/usr/bin/init.sh"]
