FROM fedora:rawhide
MAINTAINER Giuseppe Scrivano <gscrivan@redhat.com>

RUN dnf install -y docker docker-selinux cloud-utils-growpart python-docker-py docker-novolume-plugin lvm2 iptables procps-ng xz && dnf clean all
ADD init.sh /usr/bin

# system container
COPY service.template tmpfiles.template config.json.template /exports/

CMD ["/usr/bin/init.sh"]
