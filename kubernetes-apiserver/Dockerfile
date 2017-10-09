FROM kubernetes-master:rawhide

ENV container=docker

ENV NAME=kubernetes-apiserver VERSION=0.1 RELEASE=8 ARCH=x86_64
LABEL bzcomponent="$NAME" \
        name="$FGC/$NAME" \
        version="$VERSION" \
        release="$RELEASE.$DISTTAG" \
        architecture="$ARCH" \
        atomic.type='system' \
        maintainer="Jason Brooks <jbrooks@redhat.com>"

COPY launch.sh /usr/bin/kube-apiserver-docker.sh

RUN chmod +x /usr/bin/kube-apiserver

LABEL RUN /usr/bin/docker/ run -d --net=host -p 443:443

COPY service.template config.json.template /exports/

# copy kubectl into the host, another way to do this would be:
#
#     echo "runc exec -- kube-apiserver /usr/bin/kubectl \$@"  \
#     > /exports/hostfs/usr/local/bin/kubectl && chmod +x \
#     /exports/hostfs/usr/local/bin/kubectl
#
# however, this would require hard-coding the container name

RUN mkdir -p /exports/hostfs/usr/local/bin/ && cp /usr/bin/kubectl /exports/hostfs/usr/local/bin/kubectl

RUN mkdir -p /exports/hostfs/etc/kubernetes && cp /etc/kubernetes/{config,apiserver} /exports/hostfs/etc/kubernetes

ENTRYPOINT ["/usr/bin/kube-apiserver-docker.sh"]
