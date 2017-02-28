FROM centos:latest
RUN yum -y install WALinuxAgent && yum -y clean all
COPY exports/service.template /exports/
LABEL Name="azure" \
      Version="0.1" \
      atomic.type='system' \
      Architecture="x86_64"
