# Would it be too large to use fedora as base?
FROM registry.fedoraproject.org/fedora:latest

ENV VERSION=0 RELEASE=1 ARCH=X86_64

LABEL com.redhat.component="firewalld" \
      name="$FGC/firewalld" \
      version="$VERSION" \
      release="$RELEASE.$DISTTAG" \
      architecture="$ARCH" \
      usage="atomic install --system --system-package=no firewalld && systemctl start firewalld" \
      summary="The firewalld as a system container." \
      maintainer="Rui xin Bao <rubao@redhat.com>" \
      atomic.type="system"

RUN dnf install --setopt=tsflags=nodocs -y firewalld kmod && \
    rpm -V firewalld kmod && \
    dnf clean all && \
    mkdir -p /exports/hostfs/var/log/ && \
    mkdir -p /exports/hostfs/etc/{sysconfig,firewalld} && \
    mkdir -p /exports/hostfs/usr/local/share/polkit-1/actions && \
    mkdir -p /exports/hostfs/etc/dbus-1/system.d && \
    cp /etc/sysconfig/firewalld /exports/hostfs/etc/sysconfig && \
    # Copy all the polkit related files into current polkit
    cp /usr/share/polkit-1/actions/org.fedoraproject.FirewallD1.* /exports/hostfs/usr/local/share/polkit-1/actions && \
    # Copy entire firewalld related configuration file into host
    cp -r /etc/firewalld/* /exports/hostfs/etc/firewalld && \
    # Copy the dbus configuration file into the host
    cp /etc/dbus-1/system.d/FirewallD.conf /exports/hostfs/etc/dbus-1/system.d && \
    # We need /var/log/firewalld for firewalld to write messages
    touch /exports/hostfs/var/log/firewalld

# Copy the associated binaries to the corresponding location, because firewalld going to use them
RUN  cp -r /usr/lib/firewalld/* /exports/hostfs/etc/firewalld

COPY run.sh /usr/bin/

# System container files
COPY tmpfiles.template service.template manifest.json config.json.template /exports/

CMD ["/usr/bin/run.sh"]
