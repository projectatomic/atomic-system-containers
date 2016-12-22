FROM fedora:rawhide
MAINTAINER Giuseppe Scrivano <gscrivan@redhat.com>

ADD mount-in-ns.c /root
RUN dnf install -y gcc docker docker-selinux cloud-utils-growpart python-docker-py docker-novolume-plugin lvm2 iptables procps-ng xz inotify-tools && gcc /root/mount-in-ns.c -o /usr/bin/mount-in-ns && mkdir -p /usr/lib/modules && dnf clean all
ADD shim.sh init.sh init-wrapper.sh setup-keep-alive-process.sh /usr/bin/

# system container
COPY service.template tmpfiles.template config.json.template /exports/

CMD ["/usr/bin/init-wrapper.sh"]
