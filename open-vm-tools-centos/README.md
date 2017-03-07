# open-vm-tools-centos-container
# This container is for use on a VMware virtual machine 
# It manages the VM for use with VMware's management suite with vCenter and vSphere

Building open-vm-tools-centos container for fedora and atomic host:

```
# git clone https://github.com/projectatomic/atomic-system-containers
# cd atomic-system-containers/open-vm-tools-centos
# docker build --rm -t open-vm-tools-centos .
```

## As a docker container:

**Instructions for CentOS**

Running open-vm-tools-centos container

```
# docker run  --privileged -v /proc/:/hostproc/ -v /sys/fs/cgroup:/sys/fs/cgroup  -v /var/log:/var/log -v /run/systemd:/run/systemd -v /sysroot:/sysroot -v=/var/lib/sss/pipes/:/var/lib/sss/pipes/:rw -v /etc/passwd:/etc/passwd -v /etc/shadow:/etc/shadow -v /tmp:/tmp:rw -v /etc/sysconfig:/etc/sysconfig:rw -v /etc/resolv.conf:/etc/resolv.conf:rw -v /etc/nsswitch.conf:/etc/nsswitch.conf:rw -v /etc/hosts:/etc/hosts:rw -v /etc/hostname:/etc/hostname:rw -v /etc/localtime:/etc/localtime:rw -v /etc/adjtime:/etc/adjtime --env container=docker --net=host  --pid=host 
```

**Instructions for Atomic**

Installing open-vm-tools-centos container on atomic host:

```
# atomic install open-vm-tools-centos
```

Running open-vm-tools-centos container on atomic host:

```
# atomic run open-vm-tools-centos
```

Stopping open-vm-tools-centos container on atomic host:

```
# atomic stop open-vm-tools-centos
```

Uninstalling open-vm-tools-centos container on atomic host:

```
# atomic uninstall open-vm-tools-centos
```

## As a system container, with the atomic CLI:

Pull from local docker into ostree:

```
# atomic pull --storage ostree docker:open-vm-tools-centos
```

Install the container:

```
# atomic install --system open-vm-tools-centos
```

Start as a systemd service:

```
# systemctl start open-vm-tools-centos
```

Stopping the service

```
# systemctl stop open-vm-tools-centos
```

Removing the container

```
# atomic uninstall open-vm-tools-centos
```
