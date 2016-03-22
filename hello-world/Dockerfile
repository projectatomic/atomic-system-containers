FROM fedora
RUN dnf install -y nmap-ncat && dnf clean all

ADD run.sh greet.sh /usr/bin/
ADD service.template config.json.template /exports/
