FROM fedora
RUN dnf install -y nmap-ncat && dnf clean all

ADD run.sh greet.sh /usr/bin/
ADD manifest.json service.template config.json.template /exports/

LABEL Name="gscrivano/spc-helloworld" \
      Version="1" \
      Architecture="x86_64" \
      Foo="bar"
