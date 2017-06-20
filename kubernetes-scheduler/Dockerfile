FROM kubernetes-master:rawhide
MAINTAINER "Jason Brooks" <jbrooks@redhat.com>

ENV container=docker

ENV NAME=kubernetes-scheduler VERSION=0.1 RELEASE=8 ARCH=x86_64
LABEL BZComponent="$NAME" \
        Name="$FGC/$NAME" \
        Version="$VERSION" \
        Release="$RELEASE.$DISTTAG" \
        Architecture="$ARCH" \
        atomic.type='system'

COPY launch.sh /usr/bin/kube-scheduler-docker.sh

LABEL RUN /usr/bin/docker run -d --net=host

COPY service.template config.json.template /exports/

RUN mkdir -p /exports/hostfs/etc/kubernetes && cp /etc/kubernetes/{config,scheduler} /exports/hostfs/etc/kubernetes

ENTRYPOINT ["/usr/bin/kube-scheduler-docker.sh"]
