FROM fedora
RUN dnf install -y nmap-ncat && dnf clean all

COPY run.sh greet.sh /usr/bin/
COPY manifest.json service.template config.json.template /exports/

LABEL Name="gscrivano/hello-world" \
      Version="1" \
      atomic.type='system' \
      Architecture="x86_64" \
      Foo="bar"
