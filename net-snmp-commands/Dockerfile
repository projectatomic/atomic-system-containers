FROM registry.fedoraproject.org/fedora:26


LABEL maintainer="Steve Milner <smilner@redhat.com>" \
      name="net-snmp-commands" \
      version="0.1" \
      atomic.type="system" \
      atomic.run="once" \
      architecture="x86_64"

RUN dnf -y install --setopt=tsflags=nodocs net-snmp net-snmp-utils && \
    rpm -V net-snmp net-snmp-utils && \
    dnf clean all

ADD cmd.sh /usr/bin/

# System container files
COPY manifest.json config.json.template /exports/

# Generate the command list which we show when no command is provided as well
# as checking to make sure the command requested by the user is part of the
# snmp family.
RUN rpm -ql net-snmp | grep /usr/bin | cut -d "/" -f 4 >> /exports/commands.tmp && \
    rpm -ql net-snmp-utils | grep /usr/bin/ | cut -d "/" -f 4 >> /exports/commands.tmp && \
    sort /exports/commands.tmp > /exports/commands.txt


CMD ["/usr/bin/cmd.sh"]
