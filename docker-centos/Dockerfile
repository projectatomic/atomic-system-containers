FROM centos

LABEL maintainer="Giuseppe Scrivano <gscrivan@redhat.com>"

RUN yum install -y docker container-selinux cloud-utils-growpart python-docker-py docker-novolume-plugin docker-lvm-plugin lvm2 iptables procps-ng xz inotify-tools && mkdir -p /usr/lib/modules && yum-config-manager --nogpgcheck --add-repo https://cbs.centos.org/repos/virt7-docker-el-candidate/x86_64/os/ && yum install -y --nogpgcheck docker-rhel-push-plugin && yum clean all

RUN ln -s /usr/libexec/docker/docker-runc-current /usr/bin/docker-runc

ADD init.sh /usr/bin

# system container
COPY service.template tmpfiles.template config.json.template /exports/

CMD ["/usr/bin/init.sh"]
