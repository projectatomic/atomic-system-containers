FROM registry.fedoraproject.org/fedora:27


LABEL maintainer="Giuseppe Scrivano <gscrivan@redhat.com>" \
      name="net-snmp" \
      version="0.1" \
      atomic.type="system" \
      description="SNMP (Simple Network Management Protocol) is a protocol used \
for network management. The net-snmp container provides an easy means for \
monitoring Atomic Host."

ENV INSTALLED_PACKAGES="net-snmp net-snmp-utils net-snmp-agent-libs"
RUN yum -y install --setopt=tsflags=nodocs ${INSTALLED_PACKAGES} && \
    rpm -V ${INSTALLED_PACKAGES} && \
    yum clean all && \
    mkdir -p /exports/hostfs/etc/{sysconfig,snmp} /exports/hostfs/var/lib/net-snmp/ && \
    cp /etc/sysconfig/snmpd /etc/sysconfig/snmptrapd /exports/hostfs/etc/sysconfig/ && \
    cp /etc/snmp/snmpd.conf /etc/snmp/snmptrapd.conf /exports/hostfs/etc/snmp/

COPY run.sh /usr/bin/

# System container files
COPY tmpfiles.template service.template manifest.json config.json.template /exports/

CMD ["/usr/bin/run.sh"]
