# etcd-container

Building etcd container for fedora and atomic host:

```
# git clone https://github.com/projectatomic/atomic-system-containers
# cd atomic-system-containers/etcd
# docker build --rm -t etcd .
```

## As a docker container:

**Instructions for Fedora**

Running etcd container

```
#docker run -d -p 4001:4001 -p 7001:7001 -p 2379:2379 -p 2380:2380 etcd
```

**Instructions for Atomic**

Installing etcd container on atomic host:

```
#atomic install etcd
```

Running etcd container on atomic host:

```
#atomic run etcd
```

Stopping etcd container on atomic host:

```
#atomic stop etcd
```

Uninstalling etcd container on atomic host:

```
#atomic uninstall etcd
```

## As a system container, with the atomic CLI:

Pull from local docker into ostree:

```
#atomic pull --storage ostree docker:etcd
```

Install the container:

```
#atomic install --system etcd
```

Start as a systemd service:

```
#systemctl start etcd
```

Stopping the service

```
#systemctl stop etcd
```

Removing the container

```
#atomic uninstall etcd
```
