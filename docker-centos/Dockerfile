FROM centos

LABEL maintainer="Giuseppe Scrivano <gscrivan@redhat.com>" \
      name="docker-centos" \
      version="0.1" \
      atomic.type="system" \
      architecture="x86_64"


RUN yum install --setopt=tsflags=nodocs -y docker container-selinux cloud-utils-growpart python-docker-py docker-novolume-plugin docker-lvm-plugin lvm2 iptables procps-ng xz oci-register-machine && \
rpm -V docker container-selinux cloud-utils-growpart python-docker-py docker-novolume-plugin docker-lvm-plugin lvm2 iptables procps-ng xz oci-register-machine && \
mkdir -p /usr/lib/modules && \
yum-config-manager --nogpgcheck --add-repo https://cbs.centos.org/repos/virt7-docker-common-candidate/x86_64/os/ && \
yum install --setopt=tsflags=nodocs -y --nogpgcheck docker-rhel-push-plugin && \
rpm -V docker-rhel-push-plugin && \
mkdir -p /exports/hostfs/etc/docker && \
yum clean all

ADD init.sh /usr/bin

# system container
COPY service.template tmpfiles.template config.json.template manifest.json /exports/
COPY daemon.json /exports/hostfs/etc/docker/container-daemon.json
# Copy /etc/oci-umount.conf over if it exists
RUN (test -e /etc/oci-umount.conf && cp /etc/oci-umount.conf /exports/hostfs/etc) || true

CMD ["/usr/bin/init.sh"]
