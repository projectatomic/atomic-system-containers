FROM centos
MAINTAINER Giuseppe Scrivano <gscrivan@redhat.com>

RUN yum install -y docker docker-selinux python-docker-py docker-lvm-plugin docker-rhel-push-plugin docker-novolume-plugin lvm2 iptables procps-ng xz cloud-utils-growpart && yum clean all
ADD init.sh /usr/bin

# system container
COPY service.template tmpfiles.template config.json.template /exports/

CMD ["/usr/bin/init.sh"]
