FROM centos

LABEL summary="The QEMU Guest Agent" \
      io.k8s.description="This package provides an agent to run inside guests, which communicates with the host over a virtio-serial channel named 'org.qemu.guest_agent.0'" \
      io.k8s.display-name="QEMU Guest Agent" \
      license="GPLv2+ and LGPLv2+ and BSD" \
      architecture="x86_64" \
      maintainer="Vinzenz Feenstra <evilissimo@redhat.com>"

RUN yum -y --setopt=tsflags=nodocs install qemu-guest-agent
RUN /bin/mkdir -p /etc/qemu
COPY qemu-ga.conf /etc/qemu/
COPY service.template tmpfiles.template config.json.template /exports/

CMD /bin/bash /usr/bin/qemu-ga
