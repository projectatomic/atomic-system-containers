# flannel-container

This container image is intended to be run as a system container
with the atomic command line.

Building flannel container for fedora and atomic host:

```
# git clone https://github.com/projectatomic/atomic-system-containers
# cd atomic-system-containers/flannel
# docker build -t flannel .
```

**Running as system container, with the atomic CLI:**

Prerequisite:

1. etcd must be running

2. a network is configured in etcd

(example with etcd installed as a system container: `runc exec etcd etcdctl set /atomic.io/network/config '{"Network":"172.17.0.0/16"}'`)

Pull from local docker into ostree:

```
#atomic pull --storage ostree docker:flannel
```

Install the container:

```
#atomic install --system flannel
```

Start as a systemd service:

```
#systemctl start flannel
```

Stopping the service

```
#systemctl stop flannel
```

Removing the container

```
#atomic uninstall flannel
```
