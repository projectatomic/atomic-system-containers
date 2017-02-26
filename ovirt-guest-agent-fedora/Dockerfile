FROM fedora:rawhide
MAINTAINER Vinzenz Feenstra <evilissimo@redhat.com>

LABEL summary="The oVirt Guest Agent" \
      io.k8s.description="The ovirt-guest-agent is providing information about the virtual machine and allows to restart / shutdown the machine via the oVirt Portal. This image is intended to be used with virtual machines running Fedora Atomic Host." \
      io.k8s.display-name="oVirt Guest Agent" \
      license="ASL 2.0" \
      architecture="x86_64"

ADD logger_conf /root/logger_conf

RUN dnf -y install ovirt-guest-agent-common
RUN cat /root/logger_conf >> /etc/ovirt-guest-agent.conf && rm /root/logger_conf

COPY ovirt-container-shutdown.sh ovirt-container-hibernate.sh prep.sh /usr/local/bin/
COPY run.sh /usr/bin/
COPY service.template tmpfiles.template config.json.template /exports/

RUN /bin/bash /usr/local/bin/prep.sh
RUN chmod a+x /usr/local/bin/ovirt-*.sh /usr/bin/run.sh

CMD /bin/bash /usr/bin/run.sh

