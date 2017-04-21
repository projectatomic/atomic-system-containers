FROM centos

LABEL maintainer="Giuseppe Scrivano <gscrivan@redhat.com>"

RUN yum install --setopt=tsflags=nodocs -y docker container-selinux cloud-utils-growpart python-docker-py docker-novolume-plugin docker-lvm-plugin lvm2 iptables procps-ng xz oci-register-machine && \
rpm -V docker container-selinux cloud-utils-growpart python-docker-py docker-novolume-plugin docker-lvm-plugin lvm2 iptables procps-ng xz oci-register-machine && \
mkdir -p /usr/lib/modules && \
yum-config-manager --nogpgcheck --add-repo https://cbs.centos.org/repos/virt7-docker-el-candidate/x86_64/os/ && \
yum install --setopt=tsflags=nodocs -y --nogpgcheck docker-rhel-push-plugin && \
rpm -V docker-rhel-push-plugin && \
mkdir -p /exports/hostfs/etc/docker-container/sysconfig && \
mkdir -p /exports/hostfs/var/run/docker-container && \
touch /exports/hostfs/var/run/docker-container/.dir && \
mkdir -p /exports/hostfs/var/lib/docker-container && \
touch /exports/hostfs/var/lib/docker-container/.dir && \
yum clean all

ADD init.sh /usr/bin

# system container
COPY service.template tmpfiles.template config.json.template manifest.json /exports/
# docker configuration
COPY docker docker-network docker-storage docker-storage-setup /exports/hostfs/etc/docker-container/sysconfig/
COPY daemon.json /exports/hostfs/etc/docker-container/


CMD ["/usr/bin/init.sh"]
