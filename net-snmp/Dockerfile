FROM registry.fedoraproject.org/fedora:26


LABEL maintainer="Giuseppe Scrivano <gscrivan@redhat.com>" \
      name="net-snmp" \
      version="0.1" \
      atomic.type="system" \

RUN dnf -y install --setopt=tsflags=nodocs net-snmp net-snmp-utils net-snmp-agent-libs && \
    rpm -V net-snmp net-snmp-utils net-snmp-agent-libs && \
    dnf clean all

ADD run.sh /usr/bin/

# System container files
COPY tmpfiles.template service.template manifest.json config.json.template /exports/

RUN mkdir -p /exports/hostfs/etc/{sysconfig,snmp} /exports/hostfs/var/lib/net-snmp/ && \
    cp /etc/sysconfig/snmpd /etc/sysconfig/snmptrapd /exports/hostfs/etc/sysconfig/ && \
    cp /etc/snmp/snmpd.conf /etc/snmp/snmptrapd.conf /exports/hostfs/etc/snmp/

CMD ["/usr/bin/run.sh"]
